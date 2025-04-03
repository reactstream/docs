# Publishing ReactStream to npm

This guide will walk you through the process of publishing and updating the ReactStream package on npm.

## Prerequisites

Before publishing, ensure you have:

1. An npm account (create one at [npmjs.com](https://www.npmjs.com/) if needed)
2. Logged in to npm from your command line: `npm login`
3. All your code ready and tested for publishing

## Initial Package Publication

Follow these steps to publish your package for the first time:

1. **Prepare your package.json file**:
   Make sure your `package.json` includes all the necessary fields:

   ```json
   {
     "name": "@reactstream/cli",
     "version": "1.0.0",
     "description": "A comprehensive CLI toolkit for React component development",
     "main": "index.js",
     "bin": {
       "reactstream": "./bin/cli.js"
     },
     "files": [
       "bin/",
       "lib/",
       "README.md",
       "LICENSE"
     ],
     "scripts": {
       "test": "jest",
       "lint": "eslint lib bin",
       "prepare": "npm run lint && npm test"
     },
     "repository": {
       "type": "git",
       "url": "git+https://github.com/reactstream/cli.git"
     },
     "keywords": [
       "react",
       "cli",
       "component",
       "development",
       "analysis",
       "testing"
     ],
     "author": "ReactStream Team",
     "license": "MIT",
     "bugs": {
       "url": "https://github.com/reactstream/cli/issues"
     },
     "homepage": "https://github.com/reactstream/cli#readme",
     "dependencies": {
       // List your dependencies here
     },
     "devDependencies": {
       // List your dev dependencies here
     },
     "engines": {
       "node": ">=14.0.0"
     }
   }
   ```

2. **Initial publication**:
   For scoped packages (like `@reactstream/cli`), use:

   ```bash
   npm publish --access=public
   ```

   For non-scoped packages, simply use:

   ```bash
   npm publish
   ```

## Updating Your Package

When you need to update your package:

1. **Update your code** with new features or bug fixes

2. **Update the version number** following semantic versioning:

   ```bash
   # For bug fixes (0.0.x)
   npm version patch

   # For new features (0.x.0)
   npm version minor

   # For breaking changes (x.0.0)
   npm version major
   ```

   This automatically updates your `package.json` and creates a git tag.

3. **Publish the update**:

   ```bash
   npm publish
   ```

4. **Push changes to GitHub**:

   ```bash
   git push
   git push --tags
   ```

## Troubleshooting Publishing Issues

### ESLint Configuration Issues

If you encounter ESLint errors during publishing:

1. **Add an ESLint configuration file** (`.eslintrc.js`):

   ```javascript
   module.exports = {
     env: {
       node: true,
       es6: true
     },
     extends: 'eslint:recommended',
     parserOptions: {
       ecmaVersion: 2020
     },
     rules: {
       // Add specific rules as needed
     }
   };
   ```

2. **Or temporarily bypass linting**:

   Edit your `package.json` to modify the prepare script:

   ```json
   "scripts": {
     "start": "node index.js",
     "lint": "echo \"Skipping linting for now\"",
     "prepare": "echo \"Skipping prepare script\""
   }
   ```

### Version Script Infinite Loop

If you encounter infinite loops with custom version scripts:

1. **Fix the version.sh script** to prevent infinite loops:

   ```bash
   #!/bin/bash
   
   # Detect if being run from npm script to prevent infinite loop
   if [ "$npm_lifecycle_event" = "version" ]; then
       echo "Running from npm version hook - skipping automatic versioning"
       exit 0
   fi
   
   # Rest of your version script
   ```

2. **Use alternative scripts** in your package.json:

   ```json
   "scripts": {
     "increment": "bash version.sh",
     "publish-npm": "bash version.sh --no-publish && npm publish --access=public",
     "release:patch": "bash version.sh --patch",
     "release:minor": "bash version.sh --minor", 
     "release:major": "bash version.sh --major",
     "release": "bash version.sh"
   }
   ```

## Best Practices

1. **Follow semantic versioning** (MAJOR.MINOR.PATCH)
2. **Test before publishing**: Use `npm pack` to see what will be included
3. **Document changes** in a CHANGELOG.md file
4. **Create a thorough README.md** with installation and usage instructions
5. **Use `.npmignore` or the `files` field** in package.json to control what's published

Happy publishing!
