angular.module('flapperNews')

.factory 'posts' , [
  '$http'
  ($http) ->
    o = posts: []

    o.getAll = ->
      return $http.get('/posts.json').success (data) ->
        angular.copy(data, o.posts)

    o.create = (post) ->
      return $http.post('/posts.json', post).success (data) ->
        o.posts.push data

    return o
]