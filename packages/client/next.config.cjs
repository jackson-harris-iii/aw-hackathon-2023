/** @type {import('next').NextConfig} */
const nextConfig = {
  webpack: (config, options) => {
    config.module.rules.push({
      rules: [
        {
          test: /\.sol$/,
          use: [
            { loader: 'json-loader' },
            {
              loader: 'solidity-standard-json-loader',
              options: { optimize: true },
            },
          ],
        },
      ],
    });
    return config;
  },
};

module.exports = nextConfig;
