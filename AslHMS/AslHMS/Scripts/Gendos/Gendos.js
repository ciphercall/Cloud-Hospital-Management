var GendosApp = angular.module("GendosApp", ['ui.bootstrap']);

GendosApp.controller("ApiGendosController", function ($scope, $http) {

    $scope.loading = false;
    $scope.addMode = false;


    // Inital Grid view load 
    var compidF = $('#txtcompid').val();
    var changedGendosTypeiD = $('#ddlGendocTypeID option:selected').val();

    $http.get('/api/ApiGendosController/GetGendosData/', {
        params: {
            Compid: compidF,
            GendosType: changedGendosTypeiD,
        }
    }).success(function (data) {
        if (data[0].count == 1) {
            $scope.GendosData = null;
        } else {
            $scope.GendosData = data;
        }
        $scope.loading = false;
    });



    $scope.search = function (event) {
        $scope.loading = true;
        event.preventDefault();

        var compid = $('#txtcompid').val();
        var changedGendosTypeiD3 = $('#ddlGendocTypeID option:selected').val();

        $http.get('/api/ApiGendosController/GetGendosData/', {
            params: {
                Compid: compid,
                GendosType: changedGendosTypeiD3,
            }
        }).success(function (data) {
            if (data[0].count == 1) {
                $scope.GendosData = null;
            } else {
                $scope.GendosData = data;
            }
            $scope.loading = false;
        });

    };





    $scope.toggleEdit = function () {
        this.testitem.editMode = !this.testitem.editMode;
    };


    $scope.toggleEdit_Cancel = function () {
        this.testitem.editMode = !this.testitem.editMode;
        //Grid view load 
        var compid = $('#txtcompid').val();
        var changedGendosTypeiD = $('#ddlGendocTypeID option:selected').val();

        $http.get('/api/ApiGendosController/GetGendosData/', {
            params: {
                Compid: compid,
                GendosType: changedGendosTypeiD,
            }
        }).success(function (data) {
            $scope.GendosData = data;
            $scope.loading = false;
        });
    };





    //Add grid level data
    $scope.addrow = function (event) {
        $scope.loading = false;
        event.preventDefault();

        var insert = $('#txt_Insertid').val();
        if (insert == "I") {
            $('#GDNameID').val("");
            $('#remarksID').val("");
            alert("Permission Denied!!");
        }
        else {
            this.newChild.COMPID = $('#txtcompid').val();
            this.newChild.INSUSERID = $('#txtInsertUserid').val();
            this.newChild.INSLTUDE = $('#latlon').val();
            this.newChild.GDTP = $('#ddlGendocTypeID option:selected').val();
            this.newChild.GDNM = $('#GDNameID').val();
            this.newChild.REMARKS = $('#remarksID').val();
            if (this.newChild.PHARMANM != "") {
                $http.post('/api/ApiGendosController/grid/addData', this.newChild).success(function (data, status, headers, config) {

                    //Grid view load 
                    var compid1 = $('#txtcompid').val();
                    var changedGendosTypeiD = $('#ddlGendocTypeID option:selected').val();

                    $http.get('/api/ApiGendosController/GetGendosData/', {
                        params: {
                            Compid: compid1,
                            GendosType: changedGendosTypeiD,
                        }
                    }).success(function (data) {
                        $scope.GendosData = data;
                        $scope.loading = false;
                    });

                    if (data.GDID != 0) {
                        $('#GDNameID').val("");
                        $('#remarksID').val("");
                        alert("Create Successfully !!");
                        //$scope.PharmaData.push({ ID: data.ID, PHARMAID: data.PHARMAID, PHARMANM: data.PHARMANM, STATUS: data.STATUS });
                    } else {
                        $('#GDNameID').val("");
                        $('#remarksID').val("");
                        alert("Duplicate name will not create!");
                    }

                }).error(function () {
                    $scope.error = "An Error has occured while loading posts!";
                    $scope.loading = false;
                });

            }
            else {
                $('#GDNameID').val("");
                alert("Please input Gendos name field !!");
            }
        }
    };







    //Update to grid level data (save a record after edit)
    $scope.update = function () {
        $scope.loading = true;
        var frien = this.testitem;

        this.testitem.COMPID = $('#txtcompid').val();
        this.testitem.INSUSERID = $('#txtInsertUserid').val();
        this.testitem.INSLTUDE = $('#latlon').val();
        //this.testitem.STATUS = $("#gridStatusID option:selected").val();
        var Update = $('#txt_Updateid').val();

        if (Update == "I") {
            alert("Permission Denied!!");
            frien.editMode = false;
 
            //Grid view load 
            var compid5 = $('#txtcompid').val();
            var changedGendosTypeiD = $('#ddlGendocTypeID option:selected').val();

            $http.get('/api/ApiGendosController/GetGendosData/', {
                params: {
                    Compid: compid5,
                    GendosType: changedGendosTypeiD,
                }
            }).success(function (data) {
                $scope.GendosData = data;
            });

            $scope.loading = false;
        }
        else {
            $http.post('/api/ApiGendosController/grid/UpdateData', this.testitem).success(function (data) {
                if (data.GDID != 0) {
                    alert("Saved Successfully!!");
                } else {
                    alert("Duplicate data entered will not create!");
                }

                frien.editMode = false;

                //Grid view load 
                var compid6 = $('#txtcompid').val();
                var changedGendosTypeiD1 = $('#ddlGendocTypeID option:selected').val();

                $http.get('/api/ApiGendosController/GetGendosData/', {
                    params: {
                        Compid: compid6,
                        GendosType: changedGendosTypeiD1,
                    }
                }).success(function (data) {
                    $scope.GendosData = data;
                });

                $scope.loading = false;

            }).error(function (data) {
                $scope.error = "An Error has occured while Saving Friend! " + data;
                $scope.loading = false;

            });
        }
    };







    //Delete grid level data.
    $scope.deleteItem = function () {
        $scope.loading = true;
        var id = this.testitem.ID;

        var Delete = $('#txt_Deleteid').val();
        if (Delete == "I") {
            alert("Permission Denied!!");
        }
        else {
            this.testitem.COMPID = $('#txtcompid').val();
            this.testitem.INSUSERID = $('#txtInsertUserid').val();
            this.testitem.INSLTUDE = $('#latlon').val();

            $http.post('/api/ApiGendosController/grid/DeleteData/', this.testitem).success(function (data) {

                $.each($scope.GendosData, function (i) {
                    if ($scope.GendosData[i].ID === id) {
                        $scope.GendosData.splice(i, 1);
                        return false;
                    }
                });
                $scope.loading = false;
                alert("Delete Successfully!!");

            }).error(function (data) {
                $scope.error = "An Error has occured while delete posts! " + data;
                $scope.loading = false;
            });
        }
    };



});