var OTTestApp = angular.module("OTTestApp", ['ui.bootstrap']);

OTTestApp.controller("ApiOpHeadController", function ($scope, $http) {

 


    $scope.add = function (event) {
        $scope.loading = true;

        event.preventDefault();


        var compid = $('#txtcompid').val();

        var OpHeadCName = $("#OpHeadCName").val();
        var OpHeadCID = $('#OpHeadCID').val();
     
        var inUserID = $('#InUserID').val();

        var insltude = $('#latlonPos').val();

        $http.get('/api/ApiOph/GetData/', {
            params: {
                Compid: compid,

                HeadCName: OpHeadCName,
                HeadCID: OpHeadCID,
             
           
                InUserID: inUserID,
                InsLtude: insltude

            }
        }).success(function (data) {
            var OpHeadID = data[0].OpHeadID;




            if (OpHeadID != 0) {
                $scope.OpHead = data;
                document.getElementById("OpHeadName").focus();
            }
            else {
                $scope.OpHead = null;
                document.getElementById("OpHeadName").focus();
            }

            $('#OpHeadCID').val(data[0].OpHeadCID);

            $scope.loading = false;

        });

    };


    $scope.addrow = function () {
        $scope.loading = false;
        event.preventDefault();

        this.newChild.COMPID = $('#txtcompid').val();
        this.newChild.OpHeadCName = $('#OpHeadCName').val();
        this.newChild.OpHeadCID = $("#OpHeadCID").val();
        this.newChild.OpHeadName = $("#OpHeadName").val();
        this.newChild.Rate = $("#Rate").val();
        this.newChild.Remarks = $("#Remarks").val();

 

        this.newChild.INSUSERID = $('#InUserID').val();
        this.newChild.INSLTUDE = $('#latlonPos').val();

        if (this.newChild.OpHeadCName != "") {
            $http.post('/api/grid/OphChild', this.newChild).success(function (data, status, headers, config) {


                var compid = $('#txtcompid').val();

                var OpHeadCName = $("#OpHeadCName").val();
                var OpHeadCID = $('#OpHeadCID').val();

                var inUserID = $('#InUserID').val();

                var insltude = $('#latlonPos').val();

                $http.get('/api/ApiOph/GetData/', {
                    params: {
                        Compid: compid,

                        HeadCName: OpHeadCName,
                        HeadCID: OpHeadCID,


                        InUserID: inUserID,
                        InsLtude: insltude

                    }
                }).success(function (data) {
                    var OpHeadID = data[0].OpHeadID;




                    if (OpHeadID != 0) {
                        $scope.OpHead = data;
                        document.getElementById("OpHeadName").focus();
                    }
                    else {
                        $scope.OpHead = null;
                        document.getElementById("OpHeadName").focus();
                    }

                    $('#OpHeadCID').val(data[0].OpHeadCID);

                    $scope.loading = false;

                });





                if (data.OpHeadID != 0) {

                    $("#OpHeadName").val("");
                    $("#Rate").val("");
                    $('#Remarks').val("");
                  


                    //$scope.Opdata.push({ ID: data.ID, TCatId: data.TCatId, ReferPCNT: data.ReferPCNT, Remarks: data.Remarks });
                } else {
                    $("#OpHeadName").val("");
                    $("#Rate").val("");
                    $('#Remarks').val("");

                    alert("duplicate name will not create");
                }


            }).error(function () {
                $scope.error = "An Error has occured while loading posts!";
                $scope.loading = false;
            });

        } else {
            //$('#TCatId').val("");
            //$('#ReferPCNT').val("");
            //$('#Remarks').val("");

            alert("Enter Master Data First");
        }

    };

    $scope.toggleEdit = function () {
        this.testitem.editMode = !this.testitem.editMode;

    };

    $scope.cancel = function () {
        this.testitem.editMode = !this.testitem.editMode;

        var compid = $('#txtcompid').val();

        var OpHeadCName = $("#OpHeadCName").val();
        var OpHeadCID = $('#OpHeadCID').val();

        var inUserID = $('#InUserID').val();

        var insltude = $('#latlonPos').val();

        $http.get('/api/ApiOph/GetData/', {
            params: {
                Compid: compid,

                HeadCName: OpHeadCName,
                HeadCID: OpHeadCID,


                InUserID: inUserID,
                InsLtude: insltude

            }
        }).success(function (data) {
            var OpHeadID = data[0].OpHeadID;




            if (OpHeadID != 0) {
                $scope.OpHead = data;
                document.getElementById("OpHeadName").focus();
            }
            else {
                $scope.OpHead = null;
                document.getElementById("OpHeadName").focus();
            }

            $('#OpHeadCID').val(data[0].OpHeadCID);

            $scope.loading = false;

        });

    };


    $scope.save = function () {
      
        $scope.loading = true;
        var frien = this.testitem;
        this.testitem.COMPID = $('#txtcompid').val();
        this.testitem.OpHeadCID = $('#OpHeadCID').val();
        this.testitem.UPDUSERID = $('#InUserID').val();
        this.testitem.UPDLTUDE = $('#latlonPos').val();

        $http.post('/api/Apioph/SaveData', this.testitem).success(function (data) {
            if (data.OpHeadID != 0) {
                alert("Saved Successfully!!");
            } else {
                alert("Duplicate data entered");
            }

            frien.editMode = false;

            var compid = $('#txtcompid').val();

            var OpHeadCName = $("#OpHeadCName").val();
            var OpHeadCID = $('#OpHeadCID').val();

            var inUserID = $('#InUserID').val();

            var insltude = $('#latlonPos').val();

            $http.get('/api/ApiOph/GetData/', {
                params: {
                    Compid: compid,

                    HeadCName: OpHeadCName,
                    HeadCID: OpHeadCID,


                    InUserID: inUserID,
                    InsLtude: insltude

                }
            }).success(function (data) {
                var OpHeadID = data[0].OpHeadID;




                if (OpHeadID != 0) {
                    $scope.OpHead = data;

                    document.getElementById("OpHeadName").focus();
                }
                else {
                    $scope.OpHead = null;
                    document.getElementById("OpHeadName").focus();
                }

                $('#OpHeadCID').val(data[0].OpHeadCID);

              

            });

            $scope.loading = false;
        }).error(function (data) {
            $scope.error = "An Error has occured while Saving Friend! " + data;
            $scope.loading = false;

        });
    };


    $scope.deleteitem = function () {
        $scope.loading = true;
        var id = this.testitem.ID;
        $http.post('/api/ApiOph/DeleteData/', this.testitem).success(function (data) {

            $.each($scope.OpHead, function (i) {
                if ($scope.OpHead[i].ID === id) {
                    $scope.OpHead.splice(i, 1);
                    return false;
                }
            });
            document.getElementById("OpHeadName").focus();
            $scope.loading = false;
        }).error(function (data) {
            $scope.error = "An Error has occured while Saving Friend! " + data;
            $scope.loading = false;

        });
    };

    $scope.add2ndPart = function (event) {
        $scope.loading = true;

       


        var compid = $('#txtcompid').val();
        var TransactionDate = $("#TransactionDate").val();
        var patientid = $('#PatientID').val();
        var Gender = $('#Gender').val();
        var Age = $("#Age").val();
        var Address = $('#Address').val();
        var MObileNo = $('#MObileNo').val();
        var DOCTORID = $("#DoctorID").val();
        var ReferID = $("#ReferID").val();
        var DvDate = $('#DvDate').val();
        var Dvtm = $('#Dvtm').val();
        var TotalAmount = $("#TotalAmount").val();
        var DiscountRefer = $('#DiscountRefer').val();
        var DiscountHos = $('#DiscountHos').val();
        var Discountnet = $("#Discountnet").val();
        var NetAmount = $('#NetAmount').val();
        var ReceiveAmount = $("#ReceiveAmount").val();
        var DueAmount = $('#DueAmount').val();


        $http.get('/api/ApiOpd/Save2ndPart/', {
            params: {
                Compid: compid,
                TransactionDate: TransactionDate,
                PatienId: patientid,
                Gender: Gender,
                Age: Age,
                Address: Address,
                MObileNo: MObileNo,
                DoctorID: DOCTORID,
                ReferID: ReferID,
                DvDate: DvDate,
                Dvtm: Dvtm,
                TotalAmount: TotalAmount,
                DiscountRefer: DiscountRefer,
                DiscountHos: DiscountHos,
                Discountnet: Discountnet,
                NetAmount: NetAmount,
                ReceiveAmount: ReceiveAmount,
                DueAmount: DueAmount


            }
        }).success(function (data) {


            //alert("Saved");
            $("#refresh").click();



            $scope.loading = false;

        });




    };

    //$scope.GetSummOfAmount = function (Opdata) {
    //    var summ = 0;
    //    for (var i in Opdata) {
    //        summ = summ + Number(Opdata[i].Amount);
    //    }
    //    return summ;
    //};

    //$scope.GetSummOfDiscr = function (Opdata) {
    //    var summ = 0;
    //    for (var i in Opdata) {
    //        summ = summ + Number(Opdata[i].Discr);
    //    }
    //    return summ;
    //};


});