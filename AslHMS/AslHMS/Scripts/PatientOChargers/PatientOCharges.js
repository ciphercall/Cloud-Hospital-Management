var PatientOCharges = angular.module("PatientOCharges", ['ui.bootstrap']);

PatientOCharges.controller("ApiPatientOChargesController", function ($scope, $http) {
    var flag = 0;
    $scope.add = function (event) {
        $scope.loading = true;

        event.preventDefault();


        var compid = $('#txtcompid').val();

        var PatientYID = $("#PatientYearId").val();

        var inUserID = $('#InUserID').val();

        var insltude = $('#latlonPos').val();



        $http.get('/api/ApiPatientOCharges/GetData/', {
            params: {
                Compid: compid,

                Patientyearid: PatientYID,


                InUserID: inUserID,
                InsLtude: insltude

            }
        }).success(function (data) {
            var TransSerial = data[0].TransSerial;


            if (TransSerial != 0) {
                $scope.POChargeData = data;


            } else {
                $scope.POChargeData = null;

            }



            $scope.loading = false;

        });

    };


    $scope.addrow = function () {
        $scope.loading = false;
        event.preventDefault();

        this.newChild.COMPID = $('#txtcompid').val();


        this.newChild.PatientYear = $("#PatientYear").val();
        this.newChild.PatientType = $("#PatientType").val();
        this.newChild.PatientYearId = $("#PatientYearId").val();

        this.newChild.TransactionDate = $("#TransactionDate").val();
        this.newChild.ChargeName = $("#ChargeName").val();
        this.newChild.ChargeId = $("#ChargeId").val();

        this.newChild.Amount = $("#Amount").val();
        this.newChild.Remarks = $("#Remarks").val();







        this.newChild.INSUSERID = $('#InUserID').val();
        this.newChild.INSLTUDE = $('#latlonPos').val();

        if (this.newChild.PatientYearId != "" && this.newChild.TransactionDate != "") {
            $http.post('/apiPatientOCharges/grid/Child', this.newChild).success(function (data, status, headers, config) {



                var compid = $('#txtcompid').val();

                var PatientYID = $("#PatientYearId").val();

                var inUserID = $('#InUserID').val();

                var insltude = $('#latlonPos').val();



                $http.get('/api/ApiPatientOCharges/GetData/', {
                    params: {
                        Compid: compid,

                        Patientyearid: PatientYID,


                        InUserID: inUserID,
                        InsLtude: insltude

                    }
                }).success(function (data) {
                    var TransSerial = data[0].TransSerial;


                    if (TransSerial != 0) {
                        $scope.POChargeData = data;


                    } else {
                        $scope.POChargeData = null;

                    }



                    $scope.loading = false;

                });


                $scope.newChild = null;


            }).error(function () {
                $scope.error = "An Error has occured while loading posts!";
                $scope.loading = false;
            });

        } else {


            alert("Enter Master Data First");
        }

    };



    $scope.save = function () {
        // alert("Edit");
        $scope.loading = true;
        var frien = this.item;
        this.item.COMPID = $('#txtcompid').val();

        this.item.PatientYearId = $('#PatientYearId').val();
        if (flag == 1) {
            this.item.ChargeId = $('#ChargeId').val();
        }
        flag = 0;

        $http.post('/api/ApiPatientOCharge/SaveData', this.item).success(function (data) {
            if (data.TransSerial != 0) {
                alert("Saved Successfully!!");
            } else {
                alert("Duplicate data entered");
            }

            frien.editMode = false;




            var compid = $('#txtcompid').val();

            var PatientYID = $("#PatientYearId").val();

            var inUserID = $('#InUserID').val();

            var insltude = $('#latlonPos').val();



            $http.get('/api/ApiPatientOCharges/GetData/', {
                params: {
                    Compid: compid,

                    Patientyearid: PatientYID,


                    InUserID: inUserID,
                    InsLtude: insltude

                }
            }).success(function (data) {
                var TransSerial = data[0].TransSerial;


                if (TransSerial != 0) {
                    $scope.POChargeData = data;


                } else {
                    $scope.POChargeData = null;

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
        $http.post('/api/apiPatineOCharges/DeleteData/', this.item).success(function (data) {

            $.each($scope.POChargeData, function (i) {
                if ($scope.POChargeData[i].ID === id) {
                    $scope.POChargeData.splice(i, 1);
                    return false;
                }
            });
            $scope.loading = false;
        }).error(function (data) {
            $scope.error = "An Error has occured while Saving! " + data;
            $scope.loading = false;

        });
    };

    $scope.toggleEdit = function () {
        this.item.editMode = !this.item.editMode;

    };
    $scope.x = function (value) {

        flag = 1;
        var compid = $('#txtcompid').val();

        $('.gridChargeName').val(value);
        $('.gridChargeName').autocomplete({
            source: function (request, response) {

                var params = {
                    type: 'GET',
                    cache: false,
                    data: { query: request.term, query2: compid },
                    dataType: 'json',
                    success: function (data) {
                        response($.map(data, function (item) {
                            return {
                                label: item.ChargeName,
                                value: item.ChargeName,
                                id: item.ChargeId
                            };
                        }));


                    }
                };


                params.url = 'api/apiPatientOCharges/ChargeName';


                $.ajax(params);


            },
            select: function (event, ui) {
                $('.gridChargeName').val(ui.item.label);

                $('#ChargeId').val(ui.item.id);


                return true;
            },
            minLength: 1,



        });
    };

    $scope.cancel = function () {
        this.item.editMode = !this.item.editMode;

        var compid = $('#txtcompid').val();

        var PatientYID = $("#PatientYearId").val();

        var inUserID = $('#InUserID').val();

        var insltude = $('#latlonPos').val();



        $http.get('/api/ApiPatientOCharges/GetData/', {
            params: {
                Compid: compid,

                Patientyearid: PatientYID,


                InUserID: inUserID,
                InsLtude: insltude

            }
        }).success(function (data) {
            var TransSerial = data[0].TransSerial;


            if (TransSerial != 0) {
                $scope.POChargeData = data;


            } else {
                $scope.POChargeData = null;

            }



            $scope.loading = false;

        });
    
    };

});

