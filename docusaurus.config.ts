import {themes as prismThemes} from 'prism-react-renderer';
import type {Config} from '@docusaurus/types';
import type * as Preset from '@docusaurus/preset-classic';

const config: Config = {
  title: 'GitData.AI',
  tagline: 'Automate Data Centric MLOps with Data Versioning and Lineage.',
  favicon: 'img/favicon.ico',

  // Set the production url of your site here
  url: 'https://docs.gitdata.ai',
  // Set the /<baseUrl>/ pathname under which your site is served
  // For GitHub pages deployment, it is often '/<projectName>/'
  baseUrl: '/',

  // GitHub pages deployment config.
  // If you aren't using GitHub pages, you don't need these.
  organizationName: 'GitData.AI', // Usually your GitHub org/user name.
  projectName: 'docs', // Usually your repo name.

  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'warn',

  // Even if you don't use internationalization, you can use this field to set
  // useful metadata like html lang. For example, if your site is Chinese, you
  // may want to replace "en" with "zh-Hans".
  i18n: {
    defaultLocale: 'en',
    locales: ['en','cn'],
  },

  presets: [
    [
      'classic',
      {
        docs: {
          routeBasePath: '/', // Serve the docs at the site's root
          sidebarPath: './sidebars.ts',
          // Please change this to your repo.
          // Remove this to remove the "edit this page" links.
          editUrl:
            'https://github.com/facebook/docusaurus/tree/main/packages/create-docusaurus/templates/shared/',
        },
        blog: false,
        theme: {
          customCss: './src/css/custom.css',
        },
      } satisfies Preset.Options,
    ],
  ],

// refer here:
// 1.https://stackoverflow.com/questions/60783595/is-there-a-way-to-have-two-docs-in-docusaurus-2/68162605#68162605
// 2.https://github.com/galligan/docusaurus-multi
  plugins: [
    [
      '@docusaurus/plugin-content-docs',
      {
        id: 'cdm',
        path: 'cdm',
        routeBasePath: 'cdm',
        sidebarPath: require.resolve('./sidebarscdm.ts'),
        // ... other options
      },
    ],
  ],

  themeConfig: {
    // Replace with your project's social card
    image: 'img/docusaurus-social-card.jpg',
    navbar: {
      title: 'Get started',
      logo: {
        alt: 'GitData.AI Logo',
        src: 'img/logo.svg',
      },
      items: [
        {
          to: '/cdm/', // To highlight the navbar item, you must link to a document, not a top-level directory
          position: 'left',
          label: 'Collaborative Dataset Management',
          activeBaseRegex: `/cdm/`,
        },
        {
          type: 'localeDropdown',
          position: 'right',
        },
        {
          href: 'https://github.com/GitDataAI/docs',
          label: 'GitHub',
          position: 'right',
        },
      ],
    },
    footer: {
      style: 'light',
      copyright: `Copyright © ${new Date().getFullYear()} GitData.AI, Inc. Built with love.`,
    },
    prism: {
      theme: prismThemes.github,
      darkTheme: prismThemes.dracula,
    },
  } satisfies Preset.ThemeConfig,
};

export default config;
