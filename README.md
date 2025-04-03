# docs
docs.reactstream.com

# ReactStream Website

This repository contains the code for the ReactStream project website - a showcase for the ReactStream CLI tool for React component development.

## Project Structure

This website uses a component-based approach with HTML fragments loaded dynamically via JavaScript. This allows for modular development and easier maintenance.

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
    └── component-structure.md  # Project structure documentation
```

## Technologies Used

- HTML5
- CSS3 with Tailwind CSS
- Vanilla JavaScript
- Font Awesome icons
- Responsive design principles

## Features

- Fully responsive design that works on mobile, tablet, and desktop
- Component-based structure for easy maintenance
- Interactive elements like code windows and FAQ accordion
- Modern design with subtle animations and transitions
- Optimized for performance with minimal dependencies

## Getting Started

1. Clone this repository:
   ```bash
   git clone https://github.com/reactstream/website.git
   cd reactstream-website
   ```

2. Open the project in your preferred code editor.

3. Launch a local development server to view the site:
   ```bash
   # If you have Node.js installed
   npx http-server

   # Or with Python
   python -m http.server
   ```

4. View the site at http://localhost:8080 (or the port shown in your terminal).

## Customization

### Adding New Components

1. Create a new HTML file in the `components/` directory
2. Add a container div in `index.html`
3. Update the component loading logic in `main.js`

For more detailed instructions, see `docs/component-structure.md`.

### Modifying Styles

The project uses Tailwind CSS utility classes for styling with some custom CSS in `css/styles.css`. To modify the design:

1. Edit the utility classes directly in the HTML files
2. Add or modify custom styles in `css/styles.css`

## Browser Compatibility

The website is compatible with:
- Chrome/Edge (latest)
- Firefox (latest)
- Safari (latest)
- Mobile browsers (iOS Safari, Android Chrome)

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgements

- [Tailwind CSS](https://tailwindcss.com/)
- [Font Awesome](https://fontawesome.com/)
- [Hero Patterns](https://heropatterns.com/)
