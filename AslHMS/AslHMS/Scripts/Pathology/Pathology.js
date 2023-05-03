var Pathology = angular.module("Pathology", ['ui.bootstrap']);
Pathology.controller("ApiPathologyController", function ($scope, $http) {


    $scope.add = function (event) {
        $scope.loading = true;

        event.preventDefault();


        var compid = $('#txtcompid').val();

        var TRANSDT = $("#TRANSDT").val();

        var TRANSMY = $("#TRANSMY").val();
        var TRANSNO = $("#TRANSNO").val();
        var PATIENTYY = $("#PATIENTYY").val();
        var PATIENTYYID = $("#PATIENTYYID").val();

        var DVDT = $("#DVDT").val();
        var DVTM = $("#DVTM").val();
        var REMARKS = $("#REMARKS").val();
        var inUserID = $('#InUserID').val();

        var insltude = $('#latlonPos').val();



        $http.get('/api/ApiPathologyMst/GetData/', {
            params: {
                Compid: compid,

                TransactionDate: TRANSDT,
                TransMonth: TRANSMY,
                Transno: TRANSNO,
                PatientYear: PATIENTYY,
                PathientYearid: PATIENTYYID,
                deliverydt: DVDT,
                deliverydtm: DVTM,
                Remarks: REMARKS,
                InUserID: inUserID,
                InsLtude: insltude

            }
        }).success(function (data) {
            var TestSerial = data[0].TESTSL;


            if (TestSerial != 0) {
                $scope.Pathology = data;


            } else {
                $scope.Pathology = null;

            }



            $scope.loading = false;

        });

    };


    $scope.addrow = function () {
        $scope.loading = false;
        event.preventDefault();

        this.newChild.COMPID = $('#txtcompid').val();


        this.newChild.TRANSDT = $("#TRANSDT").val();
        this.newChild.TRANSMY = $("#TRANSMY").val();
        this.newChild.TRANSNO = $("#TRANSNO").val();

        this.newChild.PATIENTYY = $("#PATIENTYY").val();
        this.newChild.PATIENTYYID = $("#PATIENTYYID").val();
        this.newChild.DVDT = $("#DVDT").val();

        this.newChild.DVTM = $("#DVTM").val();

        this.newChild.AMOUNT = $("#AMOUNT").val();







        this.newChild.INSUSERID = $('#InUserID').val();
        this.newChild.INSLTUDE = $('#latlonPos').val();

        if (this.newChild.TRANSMY != "" && this.newChild.TRANSNO != "") {
            $http.post('/apiPathologyMst/grid/Child', this.newChild).success(function (data, status, headers, config) {



                $("#AMOUNT").val("");
                $("#TESTID").val("");
                $("#PathologyRemarks").val("");



                var compid = $('#txtcompid').val();

                var TRANSDT = $("#TRANSDT").val();

                var TRANSMY = $("#TRANSMY").val();
                var TRANSNO = $("#TRANSNO").val();
                var PATIENTYY = $("#PATIENTYY").val();
                var PATIENTYYID = $("#PATIENTYYID").val();

                var DVDT = $("#DVDT").val();
                var DVTM = $("#DVTM").val();
                var REMARKS = $("#REMARKS").val();
                var inUserID = $('#InUserID').val();

                var insltude = $('#latlonPos').val();



                $http.get('/api/ApiPathologyMst/GetData/', {
                    params: {
                        Compid: compid,

                        TransactionDate: TRANSDT,
                        TransMonth: TRANSMY,
                        Transno: TRANSNO,
                        PatientYear: PATIENTYY,
                        PathientYearid: PATIENTYYID,
                        deliverydt: DVDT,
                        deliverydtm: DVTM,
                        Remarks: REMARKS,
                        InUserID: inUserID,
                        InsLtude: insltude

                    }
                }).success(function (data) {
                    var TestSerial = data[0].TESTSL;


                    if (TestSerial != 0) {
                        $scope.Pathology = data;


                    } else {
                        $scope.Pathology = null;

                    }



                    $scope.loading = false;

                });







            }).error(function () {
                $scope.error = "An Error has occured while loading posts!";
                $scope.loading = false;
            });

        } else {


            alert("Enter Master Data First");
        }

    };

    $scope.toggleEdit = function () {
        this.item.editMode = !this.item.editMode;

    };

    $scope.cancel = function () {
        this.item.editMode = !this.item.editMode;

        var compid = $('#txtcompid').val();

        var TRANSDT = $("#TRANSDT").val();

        var TRANSMY = $("#TRANSMY").val();
        var TRANSNO = $("#TRANSNO").val();
        var PATIENTYY = $("#PATIENTYY").val();
        var PATIENTYYID = $("#PATIENTYYID").val();

        var DVDT = $("#DVDT").val();
        var DVTM = $("#DVTM").val();
        var REMARKS = $("#REMARKS").val();
        var inUserID = $('#InUserID').val();

        var insltude = $('#latlonPos').val();



        $http.get('/api/ApiPathologyMst/GetData/', {
            params: {
                Compid: compid,

                TransactionDate: TRANSDT,
                TransMonth: TRANSMY,
                Transno: TRANSNO,
                PatientYear: PATIENTYY,
                PathientYearid: PATIENTYYID,
                deliverydt: DVDT,
                deliverydtm: DVTM,
                Remarks: REMARKS,
                InUserID: inUserID,
                InsLtude: insltude

            }
        }).success(function (data) {
            var TestSerial = data[0].TESTSL;


            if (TestSerial != 0) {
                $scope.Pathology = data;


            } else {
                $scope.Pathology = null;

            }



            $scope.loading = false;

        });

    };



    $scope.save = function () {
        // alert("Edit");
        $scope.loading = true;
        var frien = this.item;
        this.item.COMPID = $('#txtcompid').val();

        this.item.TRANSNO = $("#TRANSNO").val();



        $http.post('/ApiPathologyMst/SaveData', this.item).success(function (data) {
            if (data.TESTSL != 0) {
                alert("Saved Successfully!!");
            } else {
                alert("Duplicate data entered");
            }

            frien.editMode = false;


            var compid = $('#txtcompid').val();

            var TRANSDT = $("#TRANSDT").val();

            var TRANSMY = $("#TRANSMY").val();
            var TRANSNO = $("#TRANSNO").val();
            var PATIENTYY = $("#PATIENTYY").val();
            var PATIENTYYID = $("#PATIENTYYID").val();

            var DVDT = $("#DVDT").val();
            var DVTM = $("#DVTM").val();
            var REMARKS = $("#REMARKS").val();
            var inUserID = $('#InUserID').val();

            var insltude = $('#latlonPos').val();



            $http.get('/api/ApiPathologyMst/GetData/', {
                params: {
                    Compid: compid,

                    TransactionDate: TRANSDT,
                    TransMonth: TRANSMY,
                    Transno: TRANSNO,
                    PatientYear: PATIENTYY,
                    PathientYearid: PATIENTYYID,
                    deliverydt: DVDT,
                    deliverydtm: DVTM,
                    Remarks: REMARKS,
                    InUserID: inUserID,
                    InsLtude: insltude

                }
            }).success(function (data) {
                var TestSerial = data[0].TESTSL;


                if (TestSerial != 0) {
                    $scope.Pathology = data;


                } else {
                    $scope.Pathology = null;

                }





            });

            $scope.loading = false;
        }).error(function (data) {
            $scope.error = "An Error has occured while Saving Friend! " + data;
            $scope.loading = false;

        });
    };

    $scope.deleteitem = function () {
        $scope.loading = true;
        var id = this.item.ID;
        $http.post('/ApiPathologyMst/DeleteData/', this.item).success(function (data) {

            $.each($scope.Pathology, function (i) {
                if ($scope.Pathology[i].ID === id) {
                    $scope.Pathology.splice(i, 1);
                    return false;
                }
            });
            $scope.loading = false;
        }).error(function (data) {
            $scope.error = "An Error has occured while Saving! " + data;
            $scope.loading = false;

        });
    };

});