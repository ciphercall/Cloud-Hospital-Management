var PatientInvestigation = angular.module("PatientInvestigation", ['ui.bootstrap']);

PatientInvestigation.controller("ApiPatientInvestigationController", function ($scope, $http) {
    var flag = 0, flagforService = 0;
    $scope.add = function (event) {
        $scope.loading = true;

        event.preventDefault();


        var compid = $('#txtcompid').val();

        var PatientYID = $("#PatientYearId").val();

        var inUserID = $('#InUserID').val();

        var insltude = $('#latlonPos').val();



        $http.get('/api/ApiPatientInvestigation/GetData/', {
            params: {
                Compid: compid,

                Patientyearid: PatientYID,


                InUserID: inUserID,
                InsLtude: insltude

            }
        }).success(function (data) {
            var TransSerial = data[0].TransSerial;


            if (TransSerial != 0) {
                $scope.PInvestigationData = data;


            } else {
                $scope.PInvestigationData = null;

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
        this.newChild.InvestigationName = $("#InvestigationName").val();
        this.newChild.InvestigationId = $("#InvestigationId").val();
        this.newChild.ServiceName = $("#ServiceName").val();
        this.newChild.ServiceId = $("#ServiceId").val();

        this.newChild.Amount = $("#Amount").val();
        this.newChild.Remarks = $("#Remarks").val();







        this.newChild.INSUSERID = $('#InUserID').val();
        this.newChild.INSLTUDE = $('#latlonPos').val();

        if (this.newChild.PatientYearId != "" && this.newChild.TransactionDate != "") {
            $http.post('/apiPatientInvestigation/grid/Child', this.newChild).success(function (data, status, headers, config) {


                var compid = $('#txtcompid').val();

                var PatientYID = $("#PatientYearId").val();

                var inUserID = $('#InUserID').val();

                var insltude = $('#latlonPos').val();



                $http.get('/api/ApiPatientInvestigation/GetData/', {
                    params: {
                        Compid: compid,

                        Patientyearid: PatientYID,


                        InUserID: inUserID,
                        InsLtude: insltude

                    }
                }).success(function (data) {
                    var TransSerial = data[0].TransSerial;


                    if (TransSerial != 0) {
                        $scope.PInvestigationData = data;


                    } else {
                        $scope.PInvestigationData = null;

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
    
        $scope.loading = true;
        var frien = this.item;
        this.item.COMPID = $('#txtcompid').val();

        this.item.PatientYearId = $('#PatientYearId').val();
        if (flag == 1) {
            this.item.InvestigationId = $('#InvestigationId').val();
        }
        if (flagforService == 1) {
            this.item.ServiceId = $('#ServiceId').val();
        }

        flag = 0;
        flagforService = 0;
        if (this.item.InvestigationId == "" || this.item.ServiceId == "") {
            alert("You did a mistake in Investigation Name or Service Name");
        } else {
            $http.post('/api/ApiPatientInvestigation/SaveData', this.item).success(function (data) {
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



                $http.get('/api/ApiPatientInvestigation/GetData/', {
                    params: {
                        Compid: compid,

                        Patientyearid: PatientYID,


                        InUserID: inUserID,
                        InsLtude: insltude

                    }
                }).success(function (data) {
                    var TransSerial = data[0].TransSerial;


                    if (TransSerial != 0) {
                        $scope.PInvestigationData = data;


                    } else {
                        $scope.PInvestigationData = null;

                    }
                 
                });

                $scope.loading = false;
            }).error(function (data) {
                $scope.error = "An Error has occured while Saving Friend! " + data;
                $scope.loading = false;

            });
        }
 

    };

    $scope.deleteitem = function () {
        $scope.loading = true;
        var id = this.item.ID;
        $http.post('/api/apiPatineInvestigation/DeleteData/', this.item).success(function (data) {

            $.each($scope.PInvestigationData, function (i) {
                if ($scope.PInvestigationData[i].ID === id) {
                    $scope.PInvestigationData.splice(i, 1);
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

        $('.gridInvestigationName').val(value);
        $('.gridInvestigationName').autocomplete({
            source: function (request, response) {

                var params = {
                    type: 'GET',
                    cache: false,
                    data: { query: request.term, query2: compid },
                    dataType: 'json',
                    success: function (data) {
                        response($.map(data, function (item) {
                            return {
                                label: item.InvestigationName,
                                value: item.InvestigationName,
                                id: item.InvestigationId
                            };
                        }));


                    }
                };


                params.url = '/api/apiPatinetInvestigation/Investigation';


                $.ajax(params);


            },
            select: function (event, ui) {
                $('.gridInvestigationName').val(ui.item.label);

                $('#InvestigationId').val(ui.item.id);


                return true;
            },
            minLength: 1,



        });
    };


    $scope.y = function (value) {

        flagforService = 1;
        var compid = $('#txtcompid').val();

        $('.gridServiceName').val(value);
        $('.gridServiceName').autocomplete({
            source: function (request, response) {

                var params = {
                    type: 'GET',
                    cache: false,
                    data: { query: request.term, query2: compid },
                    dataType: 'json',
                    success: function (data) {
                        response($.map(data, function (item) {
                            return {
                                label: item.DoctorName,
                                value: item.DoctorName,
                                id: item.DoctorId
                            };
                        }));


                    }
                };


                params.url = '/apiPatinetConsult/DoctorName';


                $.ajax(params);


            },
            select: function (event, ui) {
                $('.gridServiceName').val(ui.item.label);

                $('#ServiceId').val(ui.item.id);


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



        $http.get('/api/ApiPatientInvestigation/GetData/', {
            params: {
                Compid: compid,

                Patientyearid: PatientYID,


                InUserID: inUserID,
                InsLtude: insltude

            }
        }).success(function (data) {
            var TransSerial = data[0].TransSerial;


            if (TransSerial != 0) {
                $scope.PInvestigationData = data;


            } else {
                $scope.PInvestigationData = null;

            }



            $scope.loading = false;

        });
        $scope.newChild = null;

    };

});

