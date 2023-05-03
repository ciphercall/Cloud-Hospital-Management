var BillApp = angular.module("BillApp", ['ui.bootstrap']);

BillApp.controller("ApiBillController", function ($scope, $http) {
    $scope.add = function (event) {
        $scope.loading = true;
        event.preventDefault();


        var compid = $('#txtcompid').val();

        var date = $("#BILLDT").val();
        var year = $("#BILLYY").val();

        var billno = $("#BILLNO").val();
        var patientyear = $("#PATIENTYY").val();
        var patientyearid = $("#PATIENTYYID").val();
        var dischargedt = $("#DISCHGDT").val();
        var dischargetm = $("#DISCHGTM").val();
        var remarks = $("#RemarksMaster").val();

        var inUserID = $('#InUserID').val();

        var insltude = $('#latlonPos').val();



        $http.get('/ApiBill/GetData/', {
            params: {
                Compid: compid,
                BillDate: date,
                Billyear: year,
                Billno: billno,
                PatientYear: patientyear,
                PatientYearID: patientyearid,
                DischargeDt: dischargedt,
                DischargeTm: dischargetm,
                Remarks: remarks,

                InUserID: inUserID,
                InsLtude: insltude

            }
        }).success(function (data) {
            var BillSerial = data[0].BILLSL;


            if (BillSerial != 0) {
                $scope.BillData = data;


            } else {
                $scope.BillData = null;

            }



            $scope.loading = false;

        });


    };

    $scope.addrow = function () {
        $scope.loading = false;
        event.preventDefault();

        this.newChild.COMPID = $('#txtcompid').val();


        this.newChild.BILLDT = $("#BILLDT").val();
        this.newChild.BILLYY = $("#BILLYY").val();
        this.newChild.BILLNO = $("#BILLNO").val();

        this.newChild.PATIENTYY = $("#PATIENTYY").val();
        this.newChild.PATIENTYYID = $("#PATIENTYYID").val();


        this.newChild.AMOUNT = $("#AMOUNT").val();








        this.newChild.INSUSERID = $('#InUserID').val();
        this.newChild.INSLTUDE = $('#latlonPos').val();

        if (this.newChild.BILLNO != "" && this.newChild.BILLYY != "") {
            $http.post('/ApiBill/grid/Child', this.newChild).success(function (data, status, headers, config) {




                var compid = $('#txtcompid').val();

                var date = $("#BILLDT").val();
                var year = $("#BILLYY").val();

                var billno = $("#BILLNO").val();
                var patientyear = $("#PATIENTYY").val();
                var patientyearid = $("#PATIENTYYID").val();
                var dischargedt = $("#DISCHGDT").val();
                var dischargetm = $("#DISCHGTM").val();
                var remarks = $("#RemarksMaster").val();

                var inUserID = $('#InUserID').val();

                var insltude = $('#latlonPos').val();



                $http.get('/ApiBill/GetData/', {
                    params: {
                        Compid: compid,
                        BillDate: date,
                        Billyear: year,
                        Billno: billno,
                        PatientYear: patientyear,
                        PatientYearID: patientyearid,
                        DischargeDt: dischargedt,
                        DischargeTm: dischargetm,
                        Remarks: remarks,

                        InUserID: inUserID,
                        InsLtude: insltude

                    }
                }).success(function (data) {
                    var BillSerial = data[0].BILLSL;


                    if (BillSerial != 0) {
                        $scope.BillData = data;


                    } else {
                        $scope.BillData = null;

                    }



                    $scope.loading = false;

                });



                $("#BILLID").val("");
                $("#AMOUNT").val("");

                $('#RemarksChild').val("");










            }).error(function () {
                $scope.error = "An Error has occured while loading posts!";
                $scope.loading = false;
            });

        } else {


            alert("Enter Master Data First");
        }

    };

    $scope.GetSummOfAmount = function (BillData) {
        var summ = 0;
        var scharge = 0;
        var gross = 0;
        for (var i in BillData) {
            summ = summ + Number(BillData[i].AMOUNT);
        }
        scharge = summ * .2;
        gross = summ + scharge;
        $('#TOTAMT').val(summ);
        $('#SCHARGE').val(scharge);
        $('#GROSSAMT').val(gross);


        return summ;
    };


    $scope.toggleEdit = function () {
        this.item.editMode = !this.item.editMode;

    };

    $scope.cancel = function () {
        this.item.editMode = !this.item.editMode;

        var compid = $('#txtcompid').val();

        var date = $("#BILLDT").val();
        var year = $("#BILLYY").val();

        var billno = $("#BILLNO").val();
        var patientyear = $("#PATIENTYY").val();
        var patientyearid = $("#PATIENTYYID").val();
        var dischargedt = $("#DISCHGDT").val();
        var dischargetm = $("#DISCHGTM").val();
        var remarks = $("#RemarksMaster").val();

        var inUserID = $('#InUserID').val();

        var insltude = $('#latlonPos').val();



        $http.get('/ApiBill/GetData/', {
            params: {
                Compid: compid,
                BillDate: date,
                Billyear: year,
                Billno: billno,
                PatientYear: patientyear,
                PatientYearID: patientyearid,
                DischargeDt: dischargedt,
                DischargeTm: dischargetm,
                Remarks: remarks,

                InUserID: inUserID,
                InsLtude: insltude

            }
        }).success(function (data) {
            var BillSerial = data[0].BILLSL;


            if (BillSerial != 0) {
                $scope.BillData = data;


            } else {
                $scope.BillData = null;

            }



            $scope.loading = false;

        });
    };

    $scope.save = function () {

        $scope.loading = true;
        var frien = this.item;
        this.item.COMPID = $('#txtcompid').val();

        this.item.BILLNO = $('#BILLNO').val();



        $http.post('/ApiBill/SaveData', this.item).success(function (data) {
            if (data.BILLSL != 0) {
                alert("Saved Successfully!!");
            } else {
                alert("Duplicate data entered");
            }

            frien.editMode = false;
            var compid = $('#txtcompid').val();

            var date = $("#BILLDT").val();
            var year = $("#BILLYY").val();

            var billno = $("#BILLNO").val();
            var patientyear = $("#PATIENTYY").val();
            var patientyearid = $("#PATIENTYYID").val();
            var dischargedt = $("#DISCHGDT").val();
            var dischargetm = $("#DISCHGTM").val();
            var remarks = $("#RemarksMaster").val();

            var inUserID = $('#InUserID').val();

            var insltude = $('#latlonPos').val();



            $http.get('/ApiBill/GetData/', {
                params: {
                    Compid: compid,
                    BillDate: date,
                    Billyear: year,
                    Billno: billno,
                    PatientYear: patientyear,
                    PatientYearID: patientyearid,
                    DischargeDt: dischargedt,
                    DischargeTm: dischargetm,
                    Remarks: remarks,

                    InUserID: inUserID,
                    InsLtude: insltude

                }
            }).success(function (data) {
                var BillSerial = data[0].BILLSL;


                if (BillSerial != 0) {
                    $scope.BillData = data;


                } else {
                    $scope.BillData = null;

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
        $http.post('/ApiBill/DeleteData/', this.item).success(function (data) {

            $.each($scope.BillData, function (i) {
                if ($scope.BillData[i].ID === id) {
                    $scope.BillData.splice(i, 1);
                    return false;
                }
            });
            $scope.loading = false;
        }).error(function (data) {
            $scope.error = "An Error has occured while Saving! " + data;
            $scope.loading = false;

        });
    };


    $scope.add2ndPart = function (event) {
        $scope.loading = true;

        //event.preventDefault();


        var compid = $('#txtcompid').val();
        var billno = $("#BILLNO").val();
        var TOTAMT = $("#TOTAMT").val();
        var SCHARGE = $('#SCHARGE').val();
        var VATAMT = $('#VATAMT').val();
        var GROSSAMT = $("#GROSSAMT").val();
        var ADVAMT = $('#ADVAMT').val();
        var DISCOUNT = $('#DISCOUNT').val();
        var DISCID = $("#DISCID").val();
        var NETAMT = $("#NETAMT").val();
        var PAIDAMT = $('#PAIDAMT').val();
        var BALAMT = $('#BALAMT').val();
        var DUEHID = $("#DUEHID").val();


        $http.get('/ApiBill/Save2ndPart/', {
            params: {
                Compid: compid,
                Billno: billno,
                Totalamount: TOTAMT,
                ServiceCharge: SCHARGE,
                Vatamount: VATAMT,
                Grossamount: GROSSAMT,
                Advance: ADVAMT,
                Discount: DISCOUNT,
                Discountid: DISCID,
                Netamount: NETAMT,
                Paidamount: PAIDAMT,
                Balamount: BALAMT,
                Duehosid: DUEHID



            }
        }).success(function (data) {


            //alert("Saved");
            $("#refreshid").click();



            $scope.loading = false;

        });




    };

});