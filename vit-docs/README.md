# Vit Design System Documentation

This is the official documentation website for Vit Design System, built with [Docusaurus](https://docusaurus.io/).

## Overview

This documentation provides comprehensive guides for:
- Getting started with Vit Design System
- Installing and configuring the library
- Using all 30+ components
- Customizing themes and styling
- Implementing forms and validation
- Setting up internationalization

## Local Development

### Prerequisites

- Node.js >= 20.0
- npm or yarn

### Installation

```bash
npm install
```

### Start Development Server

```bash
npm start
```

This starts a local development server and opens a browser window. Most changes are reflected live without having to restart the server.

### Build

```bash
npm run build
```

This command generates static content into the `build` directory that can be served using any static hosting service.

### Serve Built Site

```bash
npm run serve
```

Test the production build locally before deploying.

## Documentation Structure

```
docs/
├── intro.md                    # Introduction
├── installation.md             # Installation guide
├── customization/              # Customization guides
│   ├── theming.md             # Theme customization
│   ├── values.md              # Spacing & values
│   └── i18n.md                # Internationalization
└── components/                 # Component documentation (with interactive previews)
    ├── accordion.mdx
    ├── avatar.mdx
    ├── badge.mdx
    ├── button.mdx
    ├── card.mdx
    ├── checkbox.mdx
    ├── chip.mdx
    ├── date.mdx
    ├── dialog.mdx
    ├── fields.mdx
    ├── form.mdx
    ├── input.mdx
    ├── layout.mdx
    ├── loading.mdx
    ├── modal.mdx
    ├── popover.mdx
    ├── progress.mdx
    ├── radio.mdx
    ├── select.mdx
    ├── sheet.mdx
    ├── skeleton.mdx
    ├── slider.mdx
    ├── switch.mdx
    ├── text.mdx
    └── toast.mdx
```

## Interactive Flutter Previews

Each component documentation page includes an interactive Flutter web preview powered by your example app. The previews are embedded using iframes with deep linking support.

### Building the Flutter App

To update the Flutter previews:

```bash
./build-flutter-docs.sh
```

Or manually:

```bash
cd example
flutter build web --web-renderer canvaskit --release
cp -r build/web/* ../vit-docs/static/flutter-app/
```

See [FLUTTER_INTEGRATION.md](./FLUTTER_INTEGRATION.md) for detailed instructions.

## Adding New Documentation

### Create a New Document

1. Create a new `.md` file in the appropriate directory
2. Add frontmatter:

```markdown
---
sidebar_position: 1
---

# Your Title

Content here...
```

### Update Sidebar

The sidebar is automatically generated from the file structure, but you can customize it in `sidebars.ts`.

## Deployment

The documentation can be deployed to any static hosting service:

### GitHub Pages

```bash
npm run deploy
```

### Vercel

Connect your repository to Vercel and it will automatically deploy on every push.

### Netlify

Connect your repository to Netlify and configure:
- Build command: `npm run build`
- Publish directory: `build`

## Contributing

When contributing to the documentation:

1. Keep language clear and concise
2. Provide code examples for all features
3. Include property tables for components
4. Add related component links
5. Follow the existing documentation structure
6. Test locally before submitting

## Styling

Custom styles can be added in `src/css/custom.css`.

## Components

Custom React components for the documentation are located in `src/components/`.

## License

This documentation is part of the Vit Design System project and follows the same MPL-2.0 License.
