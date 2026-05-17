import { Server } from "@modelcontextprotocol/sdk/server/index.js";
import { StdioServerTransport } from "@modelcontextprotocol/sdk/server/stdio.js";
import {
  CallToolRequestSchema,
  ListToolsRequestSchema,
} from "@modelcontextprotocol/sdk/types.js";
import { exec } from "child_process";
import { promisify } from "util";

const execAsync = promisify(exec);

const server = new Server(
  { name: "flutter-dart-mcp", version: "1.0.0" },
  { capabilities: { tools: {} } }
);

const TOOLS = [
  {
    name: "flutter_doctor",
    description: "Run flutter doctor to check the Flutter installation and connected devices.",
    inputSchema: { type: "object", properties: {} },
  },
  {
    name: "flutter_analyze",
    description: "Run flutter analyze on a project to find lint and type errors.",
    inputSchema: {
      type: "object",
      properties: {
        path: { type: "string", description: "Absolute path to the Flutter project (defaults to /workspace)" },
      },
    },
  },
  {
    name: "flutter_test",
    description: "Run flutter test on a project or a specific test file.",
    inputSchema: {
      type: "object",
      properties: {
        path: { type: "string", description: "Absolute path to the Flutter project (defaults to /workspace)" },
        target: { type: "string", description: "Optional: specific test file or directory relative to the project" },
      },
    },
  },
  {
    name: "flutter_pub_get",
    description: "Fetch all pub dependencies for a Flutter project (flutter pub get).",
    inputSchema: {
      type: "object",
      properties: {
        path: { type: "string", description: "Absolute path to the Flutter project (defaults to /workspace)" },
      },
    },
  },
  {
    name: "flutter_pub_upgrade",
    description: "Upgrade pub dependencies to their latest compatible versions.",
    inputSchema: {
      type: "object",
      properties: {
        path: { type: "string", description: "Absolute path to the Flutter project (defaults to /workspace)" },
        major_versions: { type: "boolean", description: "If true, also upgrade to breaking major versions (--major-versions flag)" },
      },
    },
  },
  {
    name: "flutter_build",
    description: "Build a Flutter app for a target platform.",
    inputSchema: {
      type: "object",
      properties: {
        path: { type: "string", description: "Absolute path to the Flutter project (defaults to /workspace)" },
        platform: {
          type: "string",
          enum: ["apk", "appbundle", "ios", "web", "linux", "windows", "macos"],
          description: "Target platform",
        },
        release: { type: "boolean", description: "Build in release mode (default: debug)" },
      },
      required: ["platform"],
    },
  },
  {
    name: "dart_format",
    description: "Format Dart source files using dart format.",
    inputSchema: {
      type: "object",
      properties: {
        path: { type: "string", description: "File or directory path to format (defaults to /workspace)" },
        check: { type: "boolean", description: "If true, only check formatting without writing changes" },
      },
    },
  },
  {
    name: "dart_analyze",
    description: "Run dart analyze (without Flutter) on a Dart-only package.",
    inputSchema: {
      type: "object",
      properties: {
        path: { type: "string", description: "Absolute path to the Dart package (defaults to /workspace)" },
      },
    },
  },
  {
    name: "pub_search",
    description: "Search for packages on pub.dev.",
    inputSchema: {
      type: "object",
      properties: {
        query: { type: "string", description: "Search query string" },
      },
      required: ["query"],
    },
  },
  {
    name: "pub_outdated",
    description: "List outdated pub dependencies for a Flutter/Dart project.",
    inputSchema: {
      type: "object",
      properties: {
        path: { type: "string", description: "Absolute path to the project (defaults to /workspace)" },
      },
    },
  },
  {
    name: "flutter_create",
    description: "Scaffold a new Flutter project.",
    inputSchema: {
      type: "object",
      properties: {
        name: { type: "string", description: "Project name (snake_case)" },
        output_dir: { type: "string", description: "Directory where the project will be created (defaults to /workspace)" },
        org: { type: "string", description: "Organisation name, e.g. com.example" },
        platforms: {
          type: "array",
          items: { type: "string", enum: ["android", "ios", "web", "linux", "windows", "macos"] },
          description: "Platforms to enable",
        },
      },
      required: ["name"],
    },
  },
];

server.setRequestHandler(ListToolsRequestSchema, async () => ({ tools: TOOLS }));

server.setRequestHandler(CallToolRequestSchema, async (request) => {
  const { name, arguments: args = {} } = request.params;
  const projectPath = args.path || "/workspace";

  try {
    let cmd;
    let cwd = projectPath;

    switch (name) {
      case "flutter_doctor":
        cmd = "flutter doctor -v";
        cwd = "/";
        break;

      case "flutter_analyze":
        cmd = "flutter analyze";
        break;

      case "flutter_test": {
        const target = args.target ? ` ${args.target}` : "";
        cmd = `flutter test${target}`;
        break;
      }

      case "flutter_pub_get":
        cmd = "flutter pub get";
        break;

      case "flutter_pub_upgrade": {
        const majorFlag = args.major_versions ? " --major-versions" : "";
        cmd = `flutter pub upgrade${majorFlag}`;
        break;
      }

      case "flutter_build": {
        const modeFlag = args.release ? " --release" : "";
        cmd = `flutter build ${args.platform}${modeFlag}`;
        break;
      }

      case "dart_format": {
        const checkFlag = args.check ? " --output=none --set-exit-if-changed" : "";
        cmd = `dart format${checkFlag} ${args.path || "/workspace"}`;
        cwd = "/";
        break;
      }

      case "dart_analyze":
        cmd = "dart analyze";
        break;

      case "pub_search":
        cmd = `dart pub search "${args.query}"`;
        cwd = "/";
        break;

      case "pub_outdated":
        cmd = "flutter pub outdated";
        break;

      case "flutter_create": {
        const orgFlag = args.org ? ` --org ${args.org}` : "";
        const platformsFlag =
          args.platforms && args.platforms.length
            ? ` --platforms=${args.platforms.join(",")}`
            : "";
        const outputDir = args.output_dir || "/workspace";
        cmd = `flutter create${orgFlag}${platformsFlag} ${args.name}`;
        cwd = outputDir;
        break;
      }

      default:
        throw new Error(`Unknown tool: ${name}`);
    }

    const { stdout, stderr } = await execAsync(cmd, {
      cwd,
      timeout: 120_000,
      env: { ...process.env, FLUTTER_SUPPRESS_ANALYTICS: "true" },
    });

    const output = [stdout, stderr].filter(Boolean).join("\n").trim();
    return { content: [{ type: "text", text: output || "(no output)" }] };
  } catch (error) {
    const msg = error.stdout
      ? [error.stdout, error.stderr].filter(Boolean).join("\n").trim()
      : error.message;
    return { content: [{ type: "text", text: msg }], isError: true };
  }
});

const transport = new StdioServerTransport();
await server.connect(transport);
