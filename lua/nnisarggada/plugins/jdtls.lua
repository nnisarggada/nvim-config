-- import plugin safely
local setup, jdtls = pcall(require, "nvim-jdtls")
if not setup then
  return
end

jdtls.start_or_attach({
  cmd = {
    vim.fn.expand("$HOME/.local/share/nvim/mason/bin/jdtls"),
    ("--jvm-arg=-javaagent:%s"):format(vim.fn.expand("$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar")),
  },
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  bundles = {
    vim.fn.expand(
      "$HOME/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"
    ),
  },
})
