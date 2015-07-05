flapperNews = angular.module('flapperNews', ['ui.router', 'templates', 'Devise'])

.config [
  '$stateProvider'
  '$urlRouterProvider'
  ($stateProvider, $urlRouterProvider) ->

    $stateProvider

    .state 'home',
      url: '/home'
      templateUrl: 'home/_home.html'
      controller: 'MainCtrl'
      resolve:
        promisePosts: [
          'posts'
          (posts) ->
            posts.getAll()
        ]

    .state 'posts',
      url: '/posts/{id}'
      templateUrl: 'posts/_posts.html'
      controller: 'PostsCtrl'
      resolve:
        post: [
          '$stateParams'
          'posts'
          ($stateParams, posts) ->
            posts.get($stateParams.id)
        ]

    $urlRouterProvider.otherwise 'home'
]