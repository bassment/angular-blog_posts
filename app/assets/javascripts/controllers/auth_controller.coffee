angular.module('flapperNews')

.controller 'AuthCtrl', [
  '$scope'
  '$state'
  'Auth'
  ($scope, $state, Auth) ->

    $scope.login = ->
      Auth.login($scope.user).then ->
        $state.go('home')

    $scope.register = ->
      Auth.register($scope.user).then ->
        $state.go('home')

    onEnter: [
      '$state'
      'Auth'
      ($state, Auth) ->
        Auth.currentUser().then ->
          $state.go('home')
    ]
]