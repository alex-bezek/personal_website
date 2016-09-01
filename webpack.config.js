var webpack = require('webpack');

module.exports = {
  plugins: [
    new webpack.ProvidePlugin({
      $: 'jquery',
      jQuery: 'jquery',
    }),
  ],
  resolve: {
    extensions: ['', '.webpack.js', '.web.js', '.js', '.jsx', '.json']
  }
};
