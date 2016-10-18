var path = require('path'),
    webpack = require('webpack'),
    ExtractTextPlugin = require('extract-text-webpack-plugin');

module.exports = {
  context: __dirname + '/app/assets',
  debug: false,
  entry: {
    application: './js/index.js'
  },
  output: {
    filename: '[name].js',
    publicPath: 'http://localhost:8080/assets',
    libraryTarget: 'umd',
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
    new webpack.HotModuleReplacementPlugin(),
    new webpack.NoErrorsPlugin(),
    new ExtractTextPlugin('[name].css', { allChunks: true }),
    new webpack.optimize.DedupePlugin(),
    new webpack.ProvidePlugin({
      $: "jquery",
      jQuery: "jquery"
    })
  ],

  resolve: {
    extensions: ['', '.webpack.js', '.web.js', '.js', '.jsx', '.json']
  }
};
