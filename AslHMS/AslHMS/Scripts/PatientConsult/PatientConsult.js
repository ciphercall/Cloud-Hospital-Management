var PatientConsultApp = angular.module("PatientConsultApp", ['ui.bootstrap']);

PatientConsultApp.controller("ApiPatientConsultController", function ($scope, $http) {
    var flag = 0;
    $scope.add = function (event) {
        $scope.loading = true;

        event.preventDefault();

       
        var compid = $('#txtcompid').val();

        var PatientYID = $("#PatientYearId").val();

        var inUserID = $('#InUserID').val();

        var insltude = $('#latlonPos').val();

    

        $http.get('/api/ApiPatientConsult/GetData/', {
            params: {
                Compid: compid,

                Patientyearid: PatientYID,

                
                InUserID: inUserID,
                InsLtude: insltude

            }
        }).success(function (data) {
            var TransSerial = data[0].TransSerial;


            if (TransSerial != 0) {
                $scope.PConsultData = data;
             

            } else {
                $scope.PConsultData = null;
               
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
        this.newChild.DoctorName = $("#DoctorName").val();
        this.newChild.DoctorId = $("#DoctorId").val();

        this.newChild.Amount = $("#Amount").val();
        this.newChild.Remarks = $("#Remarks").val();
       


      

      

        this.newChild.INSUSERID = $('#InUserID').val();
        this.newChild.INSLTUDE = $('#latlonPos').val();

        if (this.newChild.PatientYearId!= "" && this.newChild.TransactionDate !="") {
            $http.post('/apiPatientConsult/grid/ConChild', this.newChild).success(function (data, status, headers, config) {


                var compid = $('#txtcompid').val();

                var PatientYID = $("#PatientYearId").val();

                var inUserID = $('#InUserID').val();

                var insltude = $('#latlonPos').val();

             

                $http.get('/api/ApiPatientConsult/GetData/', {
                    params: {
                        Compid: compid,

                        Patientyearid: PatientYID,

                      
                        InUserID: inUserID,
                        InsLtude: insltude

                    }
                }).success(function (data) {
                    var TransSerial = data[0].TransSerial;


                    if (TransSerial != 0) {
                        $scope.PConsultData = data;
                        //$('#EFDT').val("");
                        //$('#EFTM').val("");
                        //$('#EFDT').attr('disabled', false);
                        //$('#EFTM').attr('disabled', false);

                    } else {
                        $scope.PConsultData = null;
                        //$('#EFDT').val(data[0].EFDT);
                        //$('#EFTM').val(data[0].EFTM);

                        //$('#EFDT').attr('disabled', true);
                        //$('#EFTM').attr('disabled', true);

                    }



                    $scope.loading = false;

                });


              

                    $("#Remarks").val("");
                    $("#DoctorName").val("");
               
                    $('#Amount').val("0");
                    $('#DoctorId').val("");

                


                  
               

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
            this.item.DoctorId = $('#DoctorId').val();
        }
       

        $http.post('/api/ApiPatientConsult/SaveData', this.item).success(function (data) {
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



            $http.get('/api/ApiPatientConsult/GetData/', {
                params: {
                    Compid: compid,

                    Patientyearid: PatientYID,


                    InUserID: inUserID,
                    InsLtude: insltude

                }
            }).success(function (data) {
                var TransSerial = data[0].TransSerial;


                if (TransSerial != 0) {
                    $scope.PConsultData = data;
                    //$('#EFDT').val("");
                    //$('#EFTM').val("");
                    //$('#EFDT').attr('disabled', false);
                    //$('#EFTM').attr('disabled', false);

                } else {
                    $scope.PConsultData = null;
                    //$('#EFDT').val(data[0].EFDT);
                    //$('#EFTM').val(data[0].EFTM);

                    //$('#EFDT').attr('disabled', true);
                    //$('#EFTM').attr('disabled', true);

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
        $http.post('/api/apiPatineConsult/DeleteData/', this.item).success(function (data) {

            $.each($scope.PConsultData, function (i) {
                if ($scope.PConsultData[i].ID === id) {
                    $scope.PConsultData.splice(i, 1);
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
    $scope.x = function(value) {

        flag = 1;
        var compid = $('#txtcompid').val();

        $('.gridDoctorName').val(value);
        $('.gridDoctorName').autocomplete({
            source: function(request, response) {

                var params = {
                    type: 'GET',
                    cache: false,
                    data: { query: request.term, query2: compid },
                    dataType: 'json',
                    success: function(data) {
                        response($.map(data, function(item) {
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
            select: function(event, ui) {
                $('.DoctorName').val(ui.item.label);

                $('#DoctorId').val(ui.item.id);

               
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



        $http.get('/api/ApiPatientConsult/GetData/', {
            params: {
                Compid: compid,

                Patientyearid: PatientYID,


                InUserID: inUserID,
                InsLtude: insltude

            }
        }).success(function (data) {
            var TransSerial = data[0].TransSerial;


            if (TransSerial != 0) {
                $scope.PConsultData = data;


            } else {
                $scope.PConsultData = null;

            }



            $scope.loading = false;

        });
    };

});

