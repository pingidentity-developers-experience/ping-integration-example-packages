const path = require('path');

module.exports = {
  mode: 'development',
  entry: {
    index: './src/index.js',
    dashboard: './src/dashboard.js',
  },
  output: {
    path: path.resolve(__dirname, 'public', 'js'),
    filename: '[name].js', // outputs public/js/main.js, etc.
    publicPath: '/js/',
  },
  resolve: {
    extensions: ['.js'],
  },
  experiments: {
    topLevelAwait: true, // ⬅️ required for `await` at top level
  },
  plugins: [],
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: 'esbuild-loader', // ⬅️ faster than babel for ES2020+
          options: {
            loader: 'js',
            target: 'es2020',
          },
        },
      },
    ],
  },
};