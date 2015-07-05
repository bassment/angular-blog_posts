angular.module('flapperNews')

.controller 'MainCtrl', [
  '$scope'
  'posts'
  ($scope, posts) ->
    $scope.test = 'Hello world!'
    $scope.posts = posts.posts

    $scope.addPost = ->
      return unless $scope.title
      $scope.posts.push
        title: $scope.title
        link: $scope.link
        upvotes: 0
        comments: [
          {
            author: 'Joe'
            body: 'Cool post!'
            upvotes: 0
          }
          {
            author: 'Bob'
            body: 'Great idea but everything is wrong!'
            upvotes: 0
          }
        ]
      $scope.title = ''
      $scope.link = ''

    $scope.incrementUpvotes = (post) ->
      post.upvotes += 1
]