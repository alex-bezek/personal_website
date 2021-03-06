var path = require('path'),
    webpack = require('webpack'),
    ExtractTextPlugin = require('extract-text-webpack-plugin');

module.exports = {
  context: __dirname + '/app/assets',
  debug: false,
  entry: {
    application: './js/index.js',
  },
  output: {
    filename: '[name].js',
    path: __dirname + '/tmp/assets',
    libraryTarget: 'umd',
    library: 'Wellness'
  },
  include: path.resolve(__dirname, 'node_modules'),
  module: {
    loaders: [
      {
         test: /\.js$/,
         include: /app\/assets\/js|index\.js/,
         loader: 'babel-loader',
         query: {
           presets: ['es2015', 'react'],
         },
       },
      {
        test: /\.scss$/,
        loader: ExtractTextPlugin.extract('css-loader!sass-loader'),
      },
    ]
  },
  devtool: "sourcemap",
  plugins: [
    new ExtractTextPlugin('[name].css', { allChunks: true }),
    new webpack.optimize.DedupePlugin(),
    new webpack.optimize.UglifyJsPlugin(),
    new webpack.ProvidePlugin({
      $: "jquery",
      jQuery: "jquery"
    })
  ],

  resolve: {
    extensions: ['', '.webpack.js', '.web.js', '.js', '.jsx', '.json']
  }
};
