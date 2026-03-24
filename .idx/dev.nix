{ pkgs, ... }: {
  # High-performance channel for 2026
  channel = "stable-24.11"; 

  # The "Virtual Hardware" - Tools installed in the cloud
  packages = [
    pkgs.nodejs_22       # Main engine for Frontend & Backend
    pkgs.python311       # Backup for data scripts
    pkgs.openssl.bin     # Required for secure AI connections
    pkgs.git             # For team collaboration
  ];

  # Environment Variables (Non-secret only!)
  env = {
    NODE_ENV = "development";
  };

  idx = {
    # Extensions that make coding "Noob-Friendly"
    extensions = [
      "google.gemini-cli-vscode-ide-companion" # Your AI tutor
      "esbenp.prettier-vscode"                # Auto-fixes messy code
      "dsznajder.es7-react-js-snippets"        # React code shortcuts
      "rangav.vscode-thunder-client"           # Test APIs without a browser
      "pkief.material-icon-theme"              # Makes files easy to see
    ];

    workspace = {
      # This runs ONCE when someone first opens the project
      onCreate = {
        # Installs all the "Big Three" libraries we discussed
        install-packages = "npm install express cors dotenv @google/generative-ai axios lucide-react react-router-dom @mui/material @emotion/react @emotion/styled";
      };
      
      # This runs every time the workspace wakes up
      onStart = {
        # Automatically starts the development server
        run-server = "npm run dev";
      };
    };

    # Automatically opens the preview window for your website
    previews = {
      enable = true;
      previews = {
        web = {
          command = ["npm" "run" "dev"];
          manager = "web";
          env = {
            PORT = "$PORT";
          };
        };
      };
    };
  };
}