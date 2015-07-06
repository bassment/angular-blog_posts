angular.module('flapperNews')

.controller 'NavCtrl', [
  '$scope'
  'Auth'
  ($scope, Auth) ->
    $scope.signedIn = Auth.isAuthenticated
    $scope.logout = Auth.logout

    Auth.currentUser().then (user) ->
      $scope.user = user

    $scope.$on 'device:new-registration', (e, user) ->
      $scope.user = user

    $scope.$on 'device:login', (e, user) ->
      $scope.user = user

    $scope.$on 'device:logout', (e, user) ->
      $scope.user = {}
]
