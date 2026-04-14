import type {ReactNode} from 'react';
import {useEffect} from 'react';
import Link from '@docusaurus/Link';
import Layout from '@theme/Layout';

const heroPills = [
  {label: 'VitButton', top: '6%', left: '40%'},
  {label: 'VitInput', top: '24%', left: '18%'},
  {label: 'VitForm', top: '22%', left: '63%'},
  {label: 'VitModal', top: '43%', left: '8%'},
  {label: 'VitSheet', top: '46%', left: '52%'},
  {label: 'VitToast', top: '64%', left: '24%'},
  {label: 'VitLayout', top: '66%', left: '62%'},
  {label: 'VitDate', top: '82%', left: '45%'},
];

const metrics = [
  {value: '30+', label: 'documented building blocks'},
  {value: '20+', label: 'specialized form fields'},
  {value: '6', label: 'core feedback patterns'},
];

const pillars = [
  {
    id: '01',
    title: 'Forms with workflow control',
    description:
      'VitForm goes beyond a wrapper. The docs cover multi-page flows, page validation, conditional navigation, and controller-driven updates.',
    items: ['VitForm', 'VitInput', 'VitFields'],
  },
  {
    id: '02',
    title: 'Field catalog for real product data',
    description:
      'Email, password, phone, currency, country, language, birthday, date range, terms, newsletter, and more are already packaged as reusable inputs.',
    items: ['Input', 'Select', 'Date', 'Time'],
  },
  {
    id: '03',
    title: 'Adaptive overlays and surfaces',
    description:
      'Modal, sheet, dialog, and popover patterns are documented with mobile and desktop behavior so flows stay coherent across breakpoints.',
    items: ['Modal', 'Sheet', 'Dialog', 'Popover'],
  },
  {
    id: '04',
    title: 'Feedback for every app state',
    description:
      'Loading, skeleton, progress, toast, and status components help teams represent waiting, success, warnings, and recovery without inventing patterns per screen.',
    items: ['Toast', 'Loading', 'Skeleton', 'Progress'],
  },
  {
    id: '05',
    title: 'Navigation and layout primitives',
    description:
      'VitScaffold, VitAppBar, VitBottomBar, VitListView, and Tab Bar docs focus on responsive structure, navigation, badges, and integrated motion.',
    items: ['Layout', 'Tab Bar', 'Badge'],
  },
  {
    id: '06',
    title: 'Presentation pieces that stay brandable',
    description:
      'Text, buttons, cards, avatars, chips, accordion, and status blocks expose density, color, accessibility, and animation controls instead of hard-coded visuals.',
    items: ['Text', 'Card', 'Avatar', 'Chip'],
  },
];

const showcaseCards = [
  {
    title: 'Buttons that already understand states',
    description:
      'Primary, secondary, outlined, social, icon, loading, debounced, and docked actions are all part of the documented API.',
    placeholder: 'Fixed image slot 01',
  },
  {
    title: 'Inputs designed for product flows',
    description:
      'The form stack covers validation, formatting, specialized field types, and multi-step orchestration without building custom scaffolding first.',
    placeholder: 'Fixed image slot 02',
  },
  {
    title: 'Cards and content surfaces with depth',
    description:
      'Cards ship with gradients, elevation, list modes, loading states, avatars, and actionable content layouts that fit dashboards and mobile screens.',
    placeholder: 'Fixed image slot 03',
  },
];

const capabilityGroups = [
  {
    eyebrow: 'Input and validation',
    title: 'Forms, fields, pickers, and choices',
    description:
      'The docs lean heavily into the hard part of UI systems: collecting structured data reliably across simple and multi-page flows.',
    links: [
      {label: 'Form', to: '/docs/components/form'},
      {label: 'Fields', to: '/docs/components/fields'},
      {label: 'Input', to: '/docs/components/input'},
      {label: 'Select', to: '/docs/components/select'},
      {label: 'Date', to: '/docs/components/date'},
      {label: 'Time', to: '/docs/components/time'},
      {label: 'Checkbox', to: '/docs/components/checkbox'},
      {label: 'Radio', to: '/docs/components/radio'},
      {label: 'Switch', to: '/docs/components/switch'},
      {label: 'Slider', to: '/docs/components/slider'},
    ],
  },
  {
    eyebrow: 'Structure and movement',
    title: 'Layout that already accounts for navigation',
    description:
      'Instead of isolated atoms, Vit documents scaffolds, app bars, bottom bars, list layouts, tabs, and badges together so product shells feel intentional.',
    links: [
      {label: 'Layout', to: '/docs/components/layout'},
      {label: 'Tab Bar', to: '/docs/components/tabbar'},
      {label: 'Badge', to: '/docs/components/badge'},
      {label: 'Popover', to: '/docs/components/popover'},
    ],
  },
  {
    eyebrow: 'States and recovery',
    title: 'Feedback components built for busy interfaces',
    description:
      'Toast, loading, progress, skeleton, and status components are documented with variants, controllers, accessibility notes, and practical patterns.',
    links: [
      {label: 'Toast', to: '/docs/components/toast'},
      {label: 'Loading', to: '/docs/components/loading'},
      {label: 'Skeleton', to: '/docs/components/skeleton'},
      {label: 'Progress', to: '/docs/components/progress'},
      {label: 'Status', to: '/docs/components/status'},
    ],
  },
  {
    eyebrow: 'Content and identity',
    title: 'Brand expression without losing consistency',
    description:
      'Buttons, cards, text styles, avatars, chips, and accordion patterns give teams space to shape personality while staying within a coherent system.',
    links: [
      {label: 'Button', to: '/docs/components/button'},
      {label: 'Card', to: '/docs/components/card'},
      {label: 'Text', to: '/docs/components/text'},
      {label: 'Avatar', to: '/docs/components/avatar'},
      {label: 'Chip', to: '/docs/components/chip'},
      {label: 'Accordion', to: '/docs/components/accordion'},
      {label: 'Modal', to: '/docs/components/modal'},
      {label: 'Dialog', to: '/docs/components/dialog'},
      {label: 'Sheet', to: '/docs/components/sheet'},
    ],
  },
];

const pageStyles = `
  html {
    scroll-behavior: smooth;
  }

  .vit-home {
    --vit-bg: #f5efe7;
    --vit-paper: rgba(255, 252, 247, 0.9);
    --vit-surface: #fffdf9;
    --vit-ink: #121212;
    --vit-muted: #5d5852;
    --vit-line: rgba(18, 18, 18, 0.08);
    --vit-accent: #ff6b3d;
    --vit-accent-soft: #ffd8ca;
    --vit-dark: #101011;
    --vit-dark-soft: #17171a;
    --vit-dark-line: rgba(255, 255, 255, 0.08);
    --vit-light-shadow: 0 30px 80px rgba(28, 21, 16, 0.08);
    --vit-card-shadow: 0 26px 70px rgba(28, 21, 16, 0.12);
    --vit-font-display: "Space Grotesk", "Avenir Next", "Segoe UI", sans-serif;
    --vit-font-body: "Manrope", "Avenir Next", "Segoe UI", sans-serif;
    background: #f5efe7;
    color: var(--vit-ink);
    overflow: hidden;
  }

  .vit-home,
  .vit-home * {
    box-sizing: border-box;
  }

  .vit-home section {
    position: relative;
  }

  .vit-shell {
    width: min(1180px, calc(100% - 48px));
    margin: 0 auto;
  }

  .vit-eyebrow {
    display: inline-flex;
    align-items: center;
    min-height: 34px;
    padding: 0 14px;
    border: 1px solid var(--vit-line);
    border-radius: 999px;
    background: rgba(255, 255, 255, 0.72);
    font: 700 0.68rem/1 var(--vit-font-body);
    letter-spacing: 0.18em;
    text-transform: uppercase;
    color: rgba(18, 18, 18, 0.72);
  }

  .vit-dark .vit-eyebrow {
    border-color: var(--vit-dark-line);
    background: rgba(255, 255, 255, 0.08);
    color: rgba(255, 255, 255, 0.7);
  }

  .vit-hero {
    padding: 42px 0 84px;
  }

  .vit-hero-grid {
    display: grid;
    grid-template-columns: minmax(0, 1.05fr) minmax(460px, 0.95fr);
    gap: 42px;
    align-items: center;
    min-height: calc(100vh - 140px);
  }

  .vit-hero-copy {
    max-width: 560px;
  }

  .vit-hero-copy h1,
  .vit-section-heading h2,
  .vit-capability-copy h2,
  .vit-cta-panel h2 {
    margin: 18px 0 0;
    font-family: var(--vit-font-display);
    font-weight: 700;
    letter-spacing: -0.06em;
  }

  .vit-hero-copy h1 {
    font-size: clamp(3.4rem, 7vw, 5.8rem);
    line-height: 0.93;
    max-width: 11ch;
  }

  .vit-lead,
  .vit-section-heading p,
  .vit-capability-copy p,
  .vit-cta-panel p {
    margin: 24px 0 0;
    color: var(--vit-muted);
    font: 500 clamp(1rem, 1.6vw, 1.12rem) / 1.8 var(--vit-font-body);
  }

  .vit-dark .vit-section-heading p,
  .vit-dark .vit-capability-copy p,
  .vit-dark .vit-cta-panel p {
    color: rgba(255, 255, 255, 0.68);
  }

  .vit-hero-actions {
    display: flex;
    flex-wrap: wrap;
    gap: 14px;
    margin-top: 34px;
  }

  .vit-button {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    min-height: 56px;
    padding: 0 24px;
    border-radius: 999px;
    border: 1px solid transparent;
    text-decoration: none;
    font: 700 0.98rem/1 var(--vit-font-body);
    transition:
      transform 220ms ease,
      box-shadow 220ms ease,
      border-color 220ms ease,
      background-color 220ms ease,
      color 220ms ease;
  }

  .vit-button:hover {
    transform: translateY(-2px);
    text-decoration: none;
  }

  .vit-button-primary {
    background: #111111;
    color: #ffffff;
    box-shadow: 0 20px 38px rgba(17, 17, 17, 0.18);
  }

  .vit-button-primary:hover {
    color: #ffffff;
  }

  .vit-button-secondary {
    border-color: var(--vit-line);
    background: rgba(255, 255, 255, 0.64);
    color: var(--vit-ink);
    backdrop-filter: blur(14px);
  }

  .vit-hero-metrics {
    display: grid;
    grid-template-columns: repeat(3, minmax(0, 1fr));
    gap: 14px;
    margin-top: 36px;
  }

  .vit-metric {
    padding: 16px 18px;
    border: 1px solid var(--vit-line);
    border-radius: 24px;
    background: rgba(255, 255, 255, 0.6);
    backdrop-filter: blur(12px);
  }

  .vit-metric strong {
    display: block;
    font: 700 1.4rem/1 var(--vit-font-display);
    letter-spacing: -0.05em;
  }

  .vit-metric span {
    display: block;
    margin-top: 8px;
    color: var(--vit-muted);
    font: 500 0.92rem/1.45 var(--vit-font-body);
  }

  .vit-orbit {
    position: relative;
    min-height: 620px;
  }

  .vit-orbit-core {
    position: absolute;
    inset: 16% 18% 16% 18%;
    border-radius: 42px;
    border: 1px solid rgba(255, 255, 255, 0.62);
    background: rgba(255, 252, 247, 0.94);
    box-shadow: var(--vit-card-shadow);
    backdrop-filter: blur(18px);
  }

  .vit-orbit-core::before,
  .vit-orbit-core::after {
    content: '';
    position: absolute;
    border-radius: 999px;
    filter: blur(2px);
  }

  .vit-orbit-core::before {
    inset: 14% auto auto 12%;
    width: 140px;
    height: 140px;
    background: rgba(255, 107, 61, 0.13);
  }

  .vit-orbit-core::after {
    inset: auto 10% 12% auto;
    width: 180px;
    height: 180px;
    background: rgba(17, 17, 17, 0.05);
  }

  .vit-orbit-copy {
    position: absolute;
    inset: 50%;
    width: min(340px, 70%);
    transform: translate(-50%, -50%);
    text-align: center;
    z-index: 1;
  }

  .vit-orbit-copy strong {
    display: block;
    font: 700 clamp(2rem, 3vw, 2.7rem) / 0.98 var(--vit-font-display);
    letter-spacing: -0.06em;
  }

  .vit-orbit-copy span {
    display: block;
    margin-top: 16px;
    color: var(--vit-muted);
    font: 500 0.98rem/1.7 var(--vit-font-body);
  }

  .vit-orbit-pill {
    position: absolute;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    min-width: 132px;
    min-height: 58px;
    padding: 0 22px;
    border-radius: 999px;
    border: 1px solid rgba(18, 18, 18, 0.07);
    background: rgba(255, 255, 255, 0.9);
    box-shadow: 0 18px 34px rgba(24, 18, 15, 0.08);
    font: 700 1rem/1 var(--vit-font-display);
    letter-spacing: -0.03em;
    animation: vitFloat 8s ease-in-out infinite;
  }

  .vit-scroll-hint {
    display: inline-flex;
    align-items: center;
    gap: 10px;
    margin-top: 28px;
    color: rgba(18, 18, 18, 0.62);
    font: 600 0.82rem/1 var(--vit-font-body);
    letter-spacing: 0.14em;
    text-transform: uppercase;
  }

  .vit-scroll-line {
    width: 72px;
    height: 1px;
    background: rgba(18, 18, 18, 0.32);
  }

  .vit-dark {
    color: #ffffff;
  }

  .vit-highlights {
    padding: 112px 0;
    background: #101011;
  }

  .vit-section-heading {
    max-width: 700px;
  }

  .vit-section-heading h2,
  .vit-capability-copy h2,
  .vit-cta-panel h2 {
    font-size: clamp(2.4rem, 4.3vw, 4.3rem);
    line-height: 0.98;
  }

  .vit-pillar-grid {
    display: grid;
    grid-template-columns: repeat(3, minmax(0, 1fr));
    gap: 16px;
    margin-top: 44px;
  }

  .vit-pillar-card {
    min-height: 280px;
    padding: 28px;
    border: 1px solid var(--vit-dark-line);
    border-radius: 28px;
    background:
      linear-gradient(180deg, rgba(255, 255, 255, 0.04), rgba(255, 255, 255, 0.02)),
      rgba(255, 255, 255, 0.015);
    transition:
      transform 260ms ease,
      border-color 260ms ease,
      background-color 260ms ease;
  }

  .vit-pillar-card:hover {
    transform: translateY(-6px);
    border-color: rgba(255, 255, 255, 0.16);
    background: rgba(255, 255, 255, 0.04);
  }

  .vit-pillar-id {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 42px;
    height: 42px;
    border-radius: 14px;
    background: rgba(255, 255, 255, 0.08);
    color: rgba(255, 255, 255, 0.74);
    font: 700 0.82rem/1 var(--vit-font-body);
    letter-spacing: 0.08em;
  }

  .vit-pillar-card h3 {
    margin: 22px 0 0;
    font: 700 1.42rem/1.15 var(--vit-font-display);
    letter-spacing: -0.04em;
  }

  .vit-pillar-card p {
    margin: 16px 0 0;
    color: rgba(255, 255, 255, 0.68);
    font: 500 0.98rem/1.75 var(--vit-font-body);
  }

  .vit-pill-list {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    margin: 22px 0 0;
    padding: 0;
    list-style: none;
  }

  .vit-pill-list li {
    padding: 10px 14px;
    border-radius: 999px;
    background: rgba(255, 255, 255, 0.08);
    color: rgba(255, 255, 255, 0.86);
    font: 700 0.84rem/1 var(--vit-font-body);
  }

  .vit-preview {
    padding: 112px 0 96px;
  }

  .vit-preview-grid {
    display: grid;
    gap: 24px;
    align-items: start;
  }

  .vit-preview-stack {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 18px;
  }

  .vit-preview-card {
    padding: 26px;
    border: 1px solid rgba(18, 18, 18, 0.08);
    border-radius: 30px;
    background: rgba(255, 255, 255, 0.68);
    box-shadow: var(--vit-light-shadow);
    backdrop-filter: blur(12px);
  }

  .vit-preview-card strong {
    display: block;
    font: 700 1.2rem/1.2 var(--vit-font-display);
    letter-spacing: -0.04em;
  }

  .vit-preview-card p {
    margin: 14px 0 0;
    color: var(--vit-muted);
    font: 500 0.98rem/1.7 var(--vit-font-body);
  }

  .vit-preview-panel {
    display: grid;
    grid-template-columns: repeat(3, minmax(0, 1fr));
    gap: 18px;
  }

  .vit-showcase {
    padding: 22px;
    border: 1px solid rgba(18, 18, 18, 0.08);
    border-radius: 30px;
    background: rgba(255, 255, 255, 0.88);
    box-shadow: var(--vit-light-shadow);
  }

  .vit-showcase h3 {
    margin: 0;
    font: 700 1.12rem/1.15 var(--vit-font-display);
    letter-spacing: -0.04em;
  }

  .vit-showcase p {
    margin: 12px 0 0;
    color: var(--vit-muted);
    font: 500 0.92rem/1.65 var(--vit-font-body);
  }

  .vit-showcase-preview {
    margin-top: 18px;
    padding: 18px;
    border-radius: 22px;
    background: #efe6db;
    border: 1px dashed rgba(18, 18, 18, 0.14);
    min-height: 420px;
    display: flex;
    align-items: center;
    justify-content: center;
  }

  .vit-showcase-placeholder {
    width: 100%;
    height: 100%;
    min-height: 382px;
    border-radius: 18px;
    background: rgba(255, 255, 255, 0.46);
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
    color: rgba(18, 18, 18, 0.48);
    font: 700 0.88rem/1.4 var(--vit-font-body);
    letter-spacing: 0.16em;
    text-transform: uppercase;
  }

  .vit-capabilities {
    padding: 12px 0 122px;
  }

  .vit-capability-layout {
    display: grid;
    grid-template-columns: minmax(0, 0.82fr) minmax(0, 1.18fr);
    gap: 26px;
    align-items: start;
  }

  .vit-capability-copy {
    position: sticky;
    top: 100px;
    padding: 34px;
    border: 1px solid rgba(18, 18, 18, 0.08);
    border-radius: 32px;
    background: rgba(255, 255, 255, 0.66);
    box-shadow: var(--vit-light-shadow);
    backdrop-filter: blur(12px);
  }

  .vit-capability-list {
    display: grid;
    gap: 16px;
  }

  .vit-capability-card {
    padding: 28px;
    border: 1px solid rgba(18, 18, 18, 0.08);
    border-radius: 28px;
    background: rgba(255, 255, 255, 0.78);
    box-shadow: var(--vit-light-shadow);
  }

  .vit-capability-card span {
    display: inline-block;
    color: rgba(18, 18, 18, 0.54);
    font: 700 0.72rem/1 var(--vit-font-body);
    letter-spacing: 0.18em;
    text-transform: uppercase;
  }

  .vit-capability-card h3 {
    margin: 16px 0 0;
    font: 700 1.42rem/1.12 var(--vit-font-display);
    letter-spacing: -0.04em;
  }

  .vit-capability-card p {
    margin: 14px 0 0;
    color: var(--vit-muted);
    font: 500 0.98rem/1.72 var(--vit-font-body);
  }

  .vit-link-row {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    margin-top: 22px;
  }

  .vit-link-chip {
    display: inline-flex;
    align-items: center;
    min-height: 42px;
    padding: 0 14px;
    border-radius: 999px;
    border: 1px solid rgba(18, 18, 18, 0.08);
    color: var(--vit-ink);
    background: rgba(245, 239, 231, 0.86);
    font: 700 0.9rem/1 var(--vit-font-body);
    text-decoration: none;
    transition:
      transform 220ms ease,
      background-color 220ms ease,
      border-color 220ms ease;
  }

  .vit-link-chip:hover {
    transform: translateY(-2px);
    text-decoration: none;
    border-color: rgba(18, 18, 18, 0.14);
    background: rgba(255, 216, 202, 0.7);
  }

  .vit-cta {
    padding: 0 0 128px;
  }

  .vit-cta-panel {
    padding: 42px;
    border: 1px solid rgba(18, 18, 18, 0.08);
    border-radius: 36px;
    background: rgba(255, 255, 255, 0.82);
    box-shadow: var(--vit-card-shadow);
  }

  .vit-reveal {
    opacity: 0;
    transform: translate3d(0, 42px, 0) scale(0.98);
    transition:
      opacity 700ms cubic-bezier(0.22, 1, 0.36, 1),
      transform 700ms cubic-bezier(0.22, 1, 0.36, 1);
    will-change: opacity, transform;
  }

  .vit-reveal.is-visible {
    opacity: 1;
    transform: translate3d(0, 0, 0) scale(1);
  }

  @keyframes vitFloat {
    0%,
    100% {
      transform: translate3d(0, 0, 0);
    }

    50% {
      transform: translate3d(0, -10px, 0);
    }
  }

  @media (max-width: 1100px) {
    .vit-hero-grid,
    .vit-capability-layout,
    .vit-preview-panel,
    .vit-pillar-grid {
      grid-template-columns: 1fr;
    }

    .vit-preview-stack {
      grid-template-columns: 1fr;
    }

    .vit-orbit {
      min-height: 540px;
    }

    .vit-capability-copy {
      position: static;
    }
  }

  @media (max-width: 720px) {
    .vit-shell {
      width: min(100% - 28px, 1180px);
    }

    .vit-hero {
      padding: 24px 0 60px;
    }

    .vit-hero-grid {
      gap: 28px;
      min-height: auto;
    }

    .vit-hero-actions,
    .vit-hero-metrics {
      grid-template-columns: 1fr;
      flex-direction: column;
    }

    .vit-button,
    .vit-link-chip {
      width: 100%;
    }

    .vit-orbit {
      min-height: 480px;
    }

    .vit-orbit-core {
      inset: 14% 6% 8% 6%;
    }

    .vit-orbit-copy {
      width: 72%;
    }

    .vit-orbit-pill {
      min-width: 112px;
      min-height: 50px;
      padding: 0 16px;
      font-size: 0.92rem;
    }

    .vit-highlights,
    .vit-preview,
    .vit-capabilities,
    .vit-cta {
      padding-top: 84px;
      padding-bottom: 84px;
    }

    .vit-preview,
    .vit-capabilities {
      padding-top: 74px;
    }

    .vit-preview-card,
    .vit-showcase,
    .vit-capability-copy,
    .vit-capability-card,
    .vit-pillar-card,
    .vit-cta-panel {
      padding: 22px;
      border-radius: 24px;
    }

    .vit-cta-panel {
      padding: 30px 22px;
    }
  }

  @media (prefers-reduced-motion: reduce) {
    html {
      scroll-behavior: auto;
    }

    .vit-reveal,
    .vit-orbit-pill,
    .vit-button,
    .vit-link-chip,
    .vit-pillar-card {
      animation: none !important;
      transition: none !important;
      transform: none !important;
      opacity: 1 !important;
    }
  }
`;

export default function Home(): ReactNode {
  useEffect(() => {
    const elements = Array.from(document.querySelectorAll<HTMLElement>('[data-reveal]'));

    if (!elements.length) {
      return undefined;
    }

    if (typeof window === 'undefined' || !('IntersectionObserver' in window)) {
      elements.forEach((element) => element.classList.add('is-visible'));
      return undefined;
    }

    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting) {
            entry.target.classList.add('is-visible');
            observer.unobserve(entry.target);
          }
        });
      },
      {
        threshold: 0.18,
        rootMargin: '0px 0px -10% 0px',
      },
    );

    elements.forEach((element) => observer.observe(element));

    return () => observer.disconnect();
  }, []);

  return (
    <Layout
      title="Vit Design System"
      description="Vit Design System is a Flutter-first component library with production-ready forms, overlays, navigation, feedback states, and brandable UI primitives.">
      <style>{pageStyles}</style>

      <main className="vit-home">
        <section className="vit-hero">
          <div className="vit-shell vit-hero-grid">
            <div className="vit-hero-copy vit-reveal is-visible" data-reveal>
              <span className="vit-eyebrow">Vit Design System</span>
              <h1>
                One system.
                <br />
                Every product surface.
              </h1>
              <p className="vit-lead">
                Vit packages the parts teams usually rebuild from scratch in Flutter: forms,
                specialized fields, overlays, navigation shells, feedback states, and content
                primitives that still leave room for a brand voice.
              </p>

              <div className="vit-hero-actions">
                <Link className="vit-button vit-button-primary" to="/docs/intro">
                  Get started
                </Link>
                <a className="vit-button vit-button-secondary" href="#highlights">
                  Explore the system
                </a>
              </div>

              <div className="vit-hero-metrics">
                {metrics.map((metric, index) => (
                  <div
                    className="vit-metric vit-reveal"
                    data-reveal
                    key={metric.label}
                    style={{transitionDelay: `${120 + index * 80}ms`}}>
                    <strong>{metric.value}</strong>
                    <span>{metric.label}</span>
                  </div>
                ))}
              </div>

              <a className="vit-scroll-hint" href="#preview">
                <span>Scroll for live previews</span>
                <span className="vit-scroll-line" />
              </a>
            </div>

            <div className="vit-orbit vit-reveal" data-reveal>
              <div className="vit-orbit-core" aria-hidden="true" />
              <div className="vit-orbit-copy">
                <strong>Flutter UI with real product coverage.</strong>
                <span>
                  The docs emphasize how components behave in flows, not just how they look in
                  isolation.
                </span>
              </div>

              {heroPills.map((pill, index) => (
                <div
                  aria-hidden="true"
                  className="vit-orbit-pill"
                  key={pill.label}
                  style={{
                    animationDelay: `${index * 0.55}s`,
                    top: pill.top,
                    left: pill.left,
                  }}>
                  {pill.label}
                </div>
              ))}
            </div>
          </div>
        </section>

        <section className="vit-highlights vit-dark" id="highlights">
          <div className="vit-shell">
            <div className="vit-section-heading vit-reveal" data-reveal>
              <span className="vit-eyebrow">System highlights</span>
              <h2>Designed for the flows product teams actually ship.</h2>
              <p>
                The component docs consistently point to the same strengths: adaptive surfaces,
                validated data entry, state communication, flexible presentation, and navigation
                structure that can scale from utility screens to full applications.
              </p>
            </div>

            <div className="vit-pillar-grid">
              {pillars.map((pillar, index) => (
                <article
                  className="vit-pillar-card vit-reveal"
                  data-reveal
                  key={pillar.id}
                  style={{transitionDelay: `${80 + index * 70}ms`}}>
                  <div className="vit-pillar-id">{pillar.id}</div>
                  <h3>{pillar.title}</h3>
                  <p>{pillar.description}</p>
                  <ul className="vit-pill-list">
                    {pillar.items.map((item) => (
                      <li key={item}>{item}</li>
                    ))}
                  </ul>
                </article>
              ))}
            </div>
          </div>
        </section>

        <section className="vit-preview" id="preview">
          <div className="vit-shell vit-preview-grid">
            <div className="vit-preview-stack">
              <div className="vit-preview-card vit-reveal" data-reveal>
                <span className="vit-eyebrow">Visual showcase</span>
                <strong>Documentation that stays close to the component behavior.</strong>
                <p>
                  This area is now ready for fixed imagery. You can swap each placeholder for
                  curated screenshots, product mockups, or static compositions that represent the
                  strongest parts of the system.
                </p>
              </div>

              <div className="vit-preview-card vit-reveal" data-reveal style={{transitionDelay: '120ms'}}>
                <strong>What stands out in the docs</strong>
                <p>
                  Repeated themes across the MDX pages include visual density controls,
                  accessibility notes, responsive behavior, controller APIs, loading states, and
                  theme-level customization. That is where Vit feels strongest.
                </p>
              </div>
            </div>

            <div className="vit-preview-panel">
              {showcaseCards.map((card, index) => (
                <article
                  className="vit-showcase vit-reveal"
                  data-reveal
                  key={card.title}
                  style={{transitionDelay: `${100 + index * 90}ms`}}>
                  <h3>{card.title}</h3>
                  <p>{card.description}</p>
                  <div className="vit-showcase-preview">
                    <div className="vit-showcase-placeholder">{card.placeholder}</div>
                  </div>
                </article>
              ))}
            </div>
          </div>
        </section>

        <section className="vit-capabilities" id="components">
          <div className="vit-shell vit-capability-layout">
            <div className="vit-capability-copy vit-reveal" data-reveal>
              <span className="vit-eyebrow">Coverage across the library</span>
              <h2>A design system with enough range to feel like a platform.</h2>
              <p>
                Looking across every page in <code>/vit-docs/docs/components</code>, the system is
                less about isolated widgets and more about reusable interaction layers. The shape of
                the docs suggests a toolkit built for end-to-end product screens, not just style
                samples.
              </p>
              <div className="vit-hero-actions">
                <Link className="vit-button vit-button-primary" to="/docs/components/button">
                  Browse components
                </Link>
                <Link className="vit-button vit-button-secondary" to="/docs/components/form">
                  Jump to forms
                </Link>
              </div>
            </div>

            <div className="vit-capability-list">
              {capabilityGroups.map((group, index) => (
                <article
                  className="vit-capability-card vit-reveal"
                  data-reveal
                  key={group.title}
                  style={{transitionDelay: `${90 + index * 80}ms`}}>
                  <span>{group.eyebrow}</span>
                  <h3>{group.title}</h3>
                  <p>{group.description}</p>
                  <div className="vit-link-row">
                    {group.links.map((link) => (
                      <Link className="vit-link-chip" key={link.to} to={link.to}>
                        {link.label}
                      </Link>
                    ))}
                  </div>
                </article>
              ))}
            </div>
          </div>
        </section>

        <section className="vit-cta">
          <div className="vit-shell">
            <div className="vit-cta-panel vit-reveal" data-reveal>
              <span className="vit-eyebrow">Start with the strongest paths</span>
              <h2>Use Vit when you want speed without giving up structure.</h2>
              <p>
                Begin with buttons, inputs, form flows, and layout primitives. Then layer in the
                feedback, overlays, and presentation components to keep every state of the product
                visually connected.
              </p>
              <div className="vit-hero-actions">
                <Link className="vit-button vit-button-primary" to="/docs/intro">
                  Read the introduction
                </Link>
                <Link className="vit-button vit-button-secondary" to="/docs/components/layout">
                  Explore layout docs
                </Link>
              </div>
            </div>
          </div>
        </section>
      </main>
    </Layout>
  );
}
