var OTApp = angular.module("OTApp", ['ui.bootstrap']);

OTApp.controller("ApiOTMasterController", function ($scope, $http) {


    var flag = 0;

    $scope.add = function (event) {
        $scope.loading = true;

        event.preventDefault();


        var compid = $('#txtcompid').val();

        var TransactionDate = $("#TransactionDate").val();
        var TransYear = $('#TransYear').val();
        var TransNo = $('#TransNo').val();
        var PatientType = $('#PatientType').val();
        var PatientYear = $('#PatientYear').val();
        var PatientyearId = $('#PatientyearId').val();
        var OPHID = $('#OPHID').val();
        var OPTMFR = $('#OPTMFR').val();
        var OPTMTO = $('#OPTMTO').val();
        var REMARKS = $('#REMARKS').val();
        
        
        var inUserID = $('#InUserID').val();

        var insltude = $('#latlonPos').val();

        $http.get('/api/ApiOTMaster/GetData/', {
            params: {
                Compid: compid,

              Transdt:TransactionDate,
              TransYear: TransYear,
              TransNo: TransNo,
              PatientType: PatientType,
              patientyear: PatientYear,
              patientyearId: PatientyearId,
              opheadid: OPHID,
              timefrom: OPTMFR,
              timeto: OPTMTO,
                remarks:REMARKS,

                InUserID: inUserID,
                InsLtude: insltude

            }
        }).success(function (data) {
            var OpHeadID = data[0].OPHID;




            if (OpHeadID != 0 && OpHeadID != "") {
                $scope.OTData = data;
                document.getElementById("OTPTP").focus();
            }
            else {
                $scope.OTData = null;
                document.getElementById("OTPTP").focus();
            }

           

            $scope.loading = false;

        });

    };

    $scope.refresh = function() {



    };

    $scope.addrow = function () {
        $scope.loading = false;
        event.preventDefault();

        this.newChild.COMPID = $('#txtcompid').val();
        this.newChild.TransactionDate = $('#TransactionDate').val();
        this.newChild.TransYear = $("#TransYear").val();
        this.newChild.TransNo = $("#TransNo").val();
        this.newChild.PatientType = $("#PatientType").val();
        this.newChild.PatientYear = $("#PatientYear").val();
        this.newChild.PatientyearId = $("#PatientyearId").val();
        
        this.newChild.PatientName = $("#PatientName").val();
        this.newChild.OPHID = $("#OPHID").val();
        this.newChild.OpHeadName = $("#OpHeadName").val();
        this.newChild.OPTMFR = $("#OPTMFR").val();
        this.newChild.OPTMTO = $("#OPTMTO").val();

        this.newChild.OTPID = $("#OTPID").val();


        this.newChild.INSUSERID = $('#InUserID').val();
        this.newChild.INSLTUDE = $('#latlonPos').val();

        if (this.newChild.TransactionDate != "" && this.newChild.TransYear != "" && this.newChild.TransNo != ""
            && this.newChild.PatientType != "" && this.newChild.PatientYear != "" && this.newChild.PatientyearId != ""
            && (this.newChild.OPHID != "" || this.newChild.OPHID != 0) && this.newChild.OPTMFR != "" && this.newChild.OPTMTO!="") {
            $http.post('/api/grid/OTChild', this.newChild).success(function (data, status, headers, config) {


                var compid = $('#txtcompid').val();

                var TransactionDate = $("#TransactionDate").val();
                var TransYear = $('#TransYear').val();
                var TransNo = $('#TransNo').val();
                var PatientType = $('#PatientType').val();
                var PatientYear = $('#PatientYear').val();
                var PatientyearId = $('#PatientyearId').val();
                var OPHID = $('#OPHID').val();
                var OPTMFR = $('#OPTMFR').val();
                var OPTMTO = $('#OPTMTO').val();
                var REMARKS = $('#REMARKS').val();


                var inUserID = $('#InUserID').val();

                var insltude = $('#latlonPos').val();

                $http.get('/api/ApiOTMaster/GetData/', {
                    params: {
                        Compid: compid,

                        Transdt: TransactionDate,
                        TransYear: TransYear,
                        TransNo: TransNo,
                        PatientType: PatientType,
                        patientyear: PatientYear,
                        patientyearId: PatientyearId,
                        opheadid: OPHID,
                        timefrom: OPTMFR,
                        timeto: OPTMTO,
                        remarks: REMARKS,

                        InUserID: inUserID,
                        InsLtude: insltude

                    }
                }).success(function (data) {
                    var OpHeadID = data[0].OPHID;




                    if (OpHeadID != 0 && OpHeadID != "") {
                        $scope.OTData = data;
                        document.getElementById("OTPTP").focus();
                    }
                    else {
                        $scope.OTData = null;
                        document.getElementById("OTPTP").focus();
                    }



                    $scope.loading = false;

                });





                if (data.OTPID != 0) {

                    $scope.newChild = null;


                    //$scope.Opdata.push({ ID: data.ID, TCatId: data.TCatId, ReferPCNT: data.ReferPCNT, Remarks: data.Remarks });
                } else {
                  
                    $scope.newChild = null;
                    alert("duplicate name will not create");
                }


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

        var TransactionDate = $("#TransactionDate").val();
        var TransYear = $('#TransYear').val();
        var TransNo = $('#TransNo').val();
        var PatientType = $('#PatientType').val();
        var PatientYear = $('#PatientYear').val();
        var PatientyearId = $('#PatientyearId').val();
        var OPHID = $('#OPHID').val();
        var OPTMFR = $('#OPTMFR').val();
        var OPTMTO = $('#OPTMTO').val();
        var REMARKS = $('#REMARKS').val();


        var inUserID = $('#InUserID').val();

        var insltude = $('#latlonPos').val();

        $http.get('/api/ApiOTMaster/GetData/', {
            params: {
                Compid: compid,

                Transdt: TransactionDate,
                TransYear: TransYear,
                TransNo: TransNo,
                PatientType: PatientType,
                patientyear: PatientYear,
                patientyearId: PatientyearId,
                opheadid: OPHID,
                timefrom: OPTMFR,
                timeto: OPTMTO,
                remarks: REMARKS,

                InUserID: inUserID,
                InsLtude: insltude

            }
        }).success(function (data) {
            var OpHeadID = data[0].OPHID;




            if (OpHeadID != 0 && OpHeadID != "") {
                $scope.OTData = data;
                document.getElementById("OTPTP").focus();
            }
            else {
                $scope.OTData = null;
                document.getElementById("OTPTP").focus();
            }



            $scope.loading = false;

        });

    };

    $scope.x = function (value) {

        flag = 1;
        var compid = $('#txtcompid').val();

        $('.gridOTPName').val(value);
        $('.gridOTPName').autocomplete({
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
                $('.gridOTPName').val(ui.item.label);

                $('#OTPID').val(ui.item.id);


                return true;
            },
            minLength: 1,



        });

    };
    $scope.save = function () {

        $scope.loading = true;
        var frien = this.item;


        this.item.COMPID = $('#txtcompid').val();
        this.item.TransactionDate = $('#TransactionDate').val();
        this.item.TransYear = $("#TransYear").val();
        this.item.TransNo = $("#TransNo").val();
        this.item.PatientType = $("#PatientType").val();
        this.item.PatientYear = $("#PatientYear").val();
        this.item.PatientyearId = $("#PatientyearId").val();

        this.item.PatientName = $("#PatientName").val();
        this.item.OPHID = $("#OPHID").val();
        this.item.OpHeadName = $("#OpHeadName").val();
        this.item.OPTMFR = $("#OPTMFR").val();
        this.item.OPTMTO = $("#OPTMTO").val();

    
        if (flag == 1) {
            this.item.OTPID = $('#OTPID').val();
        }
        flag = 0;
        this.item.UPDUSERID = $('#InUserID').val();
        this.item.UPDLTUDE = $('#latlonPos').val();
        if (this.item.OTPID == "") {
            alert("You did a mistake in OTP Name");
        } else {


        }
        $http.post('/apiOTMaster/SaveData', this.item).success(function (data) {
            if (data.OTPID != 0) {
                alert("Saved Successfully!!");
                $('#OTPID').val("");
            } else {
                alert("Duplicate data entered");
            }

            frien.editMode = false;
            var compid = $('#txtcompid').val();

            var TransactionDate = $("#TransactionDate").val();
            var TransYear = $('#TransYear').val();
            var TransNo = $('#TransNo').val();
            var PatientType = $('#PatientType').val();
            var PatientYear = $('#PatientYear').val();
            var PatientyearId = $('#PatientyearId').val();
            var OPHID = $('#OPHID').val();
            var OPTMFR = $('#OPTMFR').val();
            var OPTMTO = $('#OPTMTO').val();
            var REMARKS = $('#REMARKS').val();


            var inUserID = $('#InUserID').val();

            var insltude = $('#latlonPos').val();

            $http.get('/api/ApiOTMaster/GetData/', {
                params: {
                    Compid: compid,

                    Transdt: TransactionDate,
                    TransYear: TransYear,
                    TransNo: TransNo,
                    PatientType: PatientType,
                    patientyear: PatientYear,
                    patientyearId: PatientyearId,
                    opheadid: OPHID,
                    timefrom: OPTMFR,
                    timeto: OPTMTO,
                    remarks: REMARKS,

                    InUserID: inUserID,
                    InsLtude: insltude

                }
            }).success(function (data) {
                var OpHeadID = data[0].OPHID;




                if (OpHeadID != 0 && OpHeadID != "") {
                    $scope.OTData = data;
                    document.getElementById("OTPTP").focus();
                }
                else {
                    $scope.OTData = null;
                    document.getElementById("OTPTP").focus();
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
        $http.post('/apiOTMaster/DeleteData/', this.item).success(function (data) {

            $.each($scope.OTData, function (i) {
                if ($scope.OTData[i].ID === id) {
                    $scope.OTData.splice(i, 1);
                    return false;
                }
            });

            $scope.loading = false;
        }).error(function (data) {
            $scope.error = "An Error has occured while Saving Friend! " + data;
            $scope.loading = false;

        });
    };

    $scope.GetSummOfAmount = function (OTData) {
        var summ = 0;
        for (var i in OTData) {
            summ = summ + Number(OTData[i].OTPAMT);
        }
        return summ;
    };



    


});