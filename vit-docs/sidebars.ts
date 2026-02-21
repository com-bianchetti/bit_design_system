import type { SidebarsConfig } from '@docusaurus/plugin-content-docs';

// This runs in Node.js - Don't use client-side code here (browser APIs, JSX...)

/**
 * Creating a sidebar enables you to:
 - create an ordered group of docs
 - render a sidebar for each doc of that group
 - provide next/previous navigation

 The sidebars can be generated from the filesystem, or explicitly defined here.

 Create as many sidebars as you want.
 */
const sidebars: SidebarsConfig = {
  tutorialSidebar: [
    {
      type: 'category',
      label: 'Getting Started',
      items: ['intro', 'installation'],
    },
    {
      type: 'category',
      label: 'Customization',
      items: [
        'customization/theming',
        'customization/values',
        'customization/i18n',
      ],
    },
    {
      type: 'category',
      label: 'Components',
      items: [
        'components/accordion',
        'components/avatar',
        'components/badge',
        'components/button',
        'components/card',
        'components/checkbox',
        'components/chip',
        'components/date',
        'components/dialog',
        'components/fields',
        'components/form',
        'components/input',
        'components/layout',
        'components/loading',
        'components/modal',
        'components/popover',
        'components/progress',
        'components/radio',
        'components/select',
        'components/sheet',
        'components/skeleton',
        'components/slider',
        'components/status',
        'components/switch',
        'components/text',
        'components/toast',
      ],
    },
  ],
};

export default sidebars;
