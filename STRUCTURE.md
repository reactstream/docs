# ReactStream Website Structure

This document outlines the structure of the ReactStream website project.

## Project Structure

```
reactstream-website/
├── index.html              # Main entry point HTML
├── css/
│   └── styles.css          # Main stylesheet
├── js/
│   ├── main.js             # Main JavaScript functionality
│   └── components.js       # Component-specific JS functionality
├── components/             # HTML fragments for different sections
│   ├── features.html       # Features section
│   ├── how-it-works.html   # How it works section
│   ├── documentation.html  # Documentation section
│   ├── examples.html       # Examples section
│   ├── download.html       # Download CTA section
│   ├── testimonials.html   # Testimonials section
│   ├── faq.html            # FAQ section
│   └── footer.html         # Footer section
└── docs/                   # Documentation files
    ├── publish-guide.md    # Guide for publishing to npm
    └── component-structure.md  # This file
```

## How It Works

The website uses a component-based approach to organize the content:

1. **Index.html**: Contains the core structure and main header/hero section
2. **Components**: Each major section of the website is in a separate HTML fragment
3. **Dynamic Loading**: JavaScript loads each component via fetch API
4. **Styling**: CSS is centralized in styles.css with Tailwind utility classes

## Component Loading System

The website uses a simple component loading system implemented in `main.js`:

```javascript
// Function to load HTML fragments into containers
function loadComponent(id, url) {
    fetch(url)
        .then(response => response.text())
        .then(html => {
            document.getElementById(`${id}-container`).innerHTML = html;
        });
}
```

Each component is loaded into a corresponding container div in the main index.html:

```html
<div id="features-container"></div>
<div id="how-it-works-container"></div>
<!-- etc. -->
```

## Adding a New Component

To add a new component to the website:

1. Create an HTML fragment in the `components/` directory
2. Add a container div in `index.html`
3. Add the component loading call in `main.js`
4. Add any component-specific JavaScript to `components.js`

Example:

```html
<!-- New component: components/new-section.html -->
<section class="py-20 bg-white">
    <div class="container mx-auto px-4">
        <h2>New Section</h2>
        <!-- content -->
    </div>
</section>
```

```html
<!-- Add to index.html -->
<div id="new-section-container"></div>
```

```javascript
// Add to main.js
loadComponent('new-section', 'components/new-section.html');
```

## Interactive Components

For components that require JavaScript interactivity, add initialization code to `components.js`. The main script contains a timeout to ensure all components are loaded before initialization.

## Deployment

To deploy this website:

1. Ensure all files are in the correct directory structure
2. Upload all files to your web hosting service
3. Ensure the server can handle routing properly for the component loading

For local development, use a local server like:
- npm's `http-server`
- Python's `python -m http.server`
- VS Code's Live Server extension

This ensures the fetch API can properly load the component files.

# ReactStream Website - Project Structure

I've organized the ReactStream website project into a modular, component-based structure. Here's an overview of how the files are organized and how they work together:

## Main Files

- **index.html**: The entry point that loads all other components
- **css/styles.css**: Contains all custom CSS styles
- **js/main.js**: Handles dynamic loading of components
- **js/components.js**: Contains JavaScript for interactive elements

## Component Structure

The site is split into separate HTML components, each representing a section of the website:

- **components/features.html**: The features grid section
- **components/how-it-works.html**: Step-by-step workflow section
- **components/documentation.html**: Documentation and installation section
- **components/examples.html**: Example usage section
- **components/download.html**: Call to action download section
- **components/testimonials.html**: User testimonials section
- **components/faq.html**: Frequently asked questions accordion
- **components/footer.html**: Site footer with links and newsletter signup

## Documentation

- **docs/publish-guide.md**: Documentation on how to publish the ReactStream package to npm
- **docs/component-structure.md**: Detailed explanation of the website's component structure

## Build & Configuration

- **package.json**: Basic project configuration for dependency management

## How Component Loading Works

1. The main `index.html` file contains empty container divs for each component
2. The `main.js` file uses fetch to load each component's HTML into its container
3. The `components.js` file initializes any interactive elements after components are loaded

## Advantages of This Structure

1. **Modular Development**: Each section can be worked on independently
2. **Better Organization**: Files are grouped by function
3. **Easier Maintenance**: Changes to one section don't affect others
4. **Simplified Collaboration**: Team members can work on different components
5. **Performance**: Only loads what's needed for the page

This structure provides a good balance between simplicity (no framework overhead) and organization (component-based development).
