var BuyBuyReturnApp = angular.module("BuyBuyReturnApp", ['ui.bootstrap']);

BuyBuyReturnApp.controller("ApiBuyBuyReturnController", function ($scope, $http) {

    $scope.loading = false;
    $scope.addMode = false;


    $scope.toggleEdit = function () {
        this.testitem.editMode = !this.testitem.editMode;
    };



    $scope.toggleEdit_Cancel = function () {
        this.testitem.editMode = !this.testitem.editMode;

        //Grid view load
        var companyid = $('#txtcompid').val();
        var transType = $('#transactionType option:selected').val();
        var transMonthYear = $('#hiddentxt_TransMonthYear').val();
        var transNo = $('#transNO').val();

        $http.get('/api/ApiBuyBuyReturnController/GetItemList/', {
            params: {
                cid: companyid,
                tType: transType,
                myear: transMonthYear,
                memoNO: transNo
            }
        }).success(function (data) {
            if (data[0].count == 1) {
                $scope.BuyBuyReturnData = null;
            } else {
                $scope.BuyBuyReturnData = data;
            }
            $scope.loading = false;
        });
    };





    //Add grid level data
    $scope.addrow = function (event) {
        $scope.loading = false;
        event.preventDefault();

        var insert = $('#txt_Insertid').val();
        if (insert == "I") {
            $('#hiddentxt_MEDIID').val("");
            $('#itemName_MEDIname').val("");
            $('#qty').val("");
            $('#rate').val("");
            $('#amount').val("");
            //alert("Permission Denied!!");
            swal("Here's a message!", "Permission Denied!");
        }
        else {
            this.newChild.COMPID = $('#txtcompid').val();
            this.newChild.INSUSERID = $('#txtInsertUserid').val();
            this.newChild.INSLTUDE = $('#latlon').val();
            this.newChild.TRANSMY = $('#hiddentxt_TransMonthYear').val();
            this.newChild.DEPT_FR_TO = $('#hiddentxt_DepartmentFromTO').val();
            this.newChild.SUPPLIERID = $('#hiddentxt_SupplierID').val();
            //this.newChild.PATIENTYYID = $('#hiddentxt_PatientYearID').val();
            //this.newChild.PATIENTYY = $('#hiddentxt_PatientYear').val();

            this.newChild.SupplierName = $('#supplierName').val();
            this.newChild.DepartmentName = $('#departmentName').val();
            //this.newChild.PatientName = $('#patientName').val();
            this.newChild.MEDINM = $('#itemName_MEDIname').val();

            this.newChild.TRANSTP = $('#transactionType option:selected').val();
            this.newChild.TRANSDT = $('#transactionDate').val();
            this.newChild.TRANSNO = $('#transNO').val();
            //this.newChild.PATIENTTP = $('#patientType option:selected').val();
            //this.newChild.PATIENTID = $('#patientId').val();
            this.newChild.MEDIID = $('#hiddentxt_MEDIID').val();
            this.newChild.QTY = $('#qty').val();
            this.newChild.RATE = $('#rate').val();
            this.newChild.AMOUNT = $('#amount').val();


            var memoNO = document.getElementById('transNO');
            if (this.newChild.MEDIID != "" && this.newChild.MEDIID != 0 && this.newChild.MEDINM != "" && this.newChild.TRANSDT != "" && this.newChild.TRANSNO != "" && this.newChild.DEPT_FR_TO != "" && this.newChild.SUPPLIERID != "" && this.newChild.SUPPLIERID != 0 && this.newChild.SupplierName != "" && this.newChild.DepartmentName != "" && this.newChild.DEPT_FR_TO != 0 && this.newChild.DEPT_FR_TO != "" && this.newChild.QTY != 0 && this.newChild.QTY != "") {
                $http.post('/api/ApiBuyBuyReturnController/grid/addData', this.newChild).success(function (data, status, headers, config) {
                    memoNO.value = data.TRANSNO;

                    //Disabled required field when select insert button.
                    $("#transactionType").prop("disabled", true);
                    $("#transactionDate").prop("disabled", true);
                    //$("#patientType").prop("disabled", true);
                    //$("#patientId").prop("disabled", true);
                    $('#supplierName').prop("disabled", true);
                    $("#departmentName").prop("disabled", true);


                    //Grid view load 
                    var companyid = $('#txtcompid').val();
                    var transType = $('#transactionType option:selected').val();
                    var transMonthYear = $('#hiddentxt_TransMonthYear').val();
                    var transNo = $('#transNO').val();

                    $http.get('/api/ApiBuyBuyReturnController/GetItemList/', {
                        params: {
                            cid: companyid,
                            tType: transType,
                            myear: transMonthYear,
                            memoNO: transNo
                        }
                    }).success(function (data) {
                        if (data[0].count == 1) {
                            $scope.BuyBuyReturnData = null;
                        } else {
                            $scope.BuyBuyReturnData = data;
                        }
                        $scope.loading = false;
                    });


                    if (data.MEDIID != 0) {
                        $('#hiddentxt_MEDIID').val("");
                        $('#itemName_MEDIname').val("");
                        $('#qty').val("");
                        $('#rate').val("");
                        $('#amount').val("");
                        //alert("Create Successfully !!");
                        //swal("Create Successfully!", "You clicked the button!", "success");
                        //$scope.BuyBuyReturnData.push({ ID: data.ID, MCATID: data.MCATID, MEDIID: data.MEDIID, MEDINM: data.MEDINM, PHARMAID: data.PHARMAID, GHEADID: data.GHEADID });
                    } else {
                        $('#hiddentxt_MEDIID').val("");
                        $('#itemName_MEDIname').val("");
                        $('#qty').val("");
                        $('#rate').val("");
                        $('#amount').val("");
                        //alert("Duplicate name will not create!");
                        swal("warning!", "Duplicate name will not create!", "error");
                    }

                }).error(function () {
                    $scope.error = "An Error has occured while loading posts!";
                    $scope.loading = false;
                });

            }
            else if (this.newChild.MEDIID == 0 || this.newChild.MEDIID == "") {
                $('#hiddentxt_MEDIID').val("");
                $('#itemName_MEDIname').val("");
                $('#qty').val("");
                $('#rate').val("");
                $('#amount').val("");
                //alert("Please select valid item name first !!");
                swal("warning!", "Please select valid item name first !", "error");
            }
            else {
                //alert("Please input required field !!");
                swal("warning!", "Please input required field !", "error");
            }
        }
    };





    //Update to grid level data
    $scope.update = function () {
        $scope.loading = true;
        var frien = this.testitem;

        this.testitem.COMPID = $('#txtcompid').val();
        this.testitem.INSUSERID = $('#txtInsertUserid').val();
        this.testitem.INSLTUDE = $('#latlon').val();
        this.testitem.TRANSMY = $('#hiddentxt_TransMonthYear').val();
        this.testitem.DEPT_FR_TO = $('#hiddentxt_DepartmentFromTO').val();
        this.testitem.SUPPLIERID = $('#hiddentxt_SupplierID').val();
        //this.testitem.PATIENTYYID = $('#hiddentxt_PatientYearID').val();
        //this.testitem.PATIENTYY = $('#hiddentxt_PatientYear').val();

        this.testitem.SupplierName = $('#supplierName').val();
        this.testitem.DepartmentName = $('#departmentName').val();
        //this.testitem.PatientName = $('#patientName').val();

        this.testitem.TRANSTP = $('#transactionType option:selected').val();
        this.testitem.TRANSDT = $('#transactionDate').val();
        this.testitem.TRANSNO = $('#transNO').val();
        //this.testitem.PATIENTTP = $('#patientType option:selected').val();
        //this.testitem.PATIENTID = $('#patientId').val();

        //this.testitem.QTY = $('#gridQtyID').val();
        //this.testitem.RATE = $('#gridRateID').val();
        //this.testitem.AMOUNT = $('#gridAmountID').val();


        $http.post('/api/ApiBuyBuyReturnController/grid/UpdateData', this.testitem).success(function (data) {
            if (data.MEDIID != 0) {
                //alert("Saved Successfully!!");
                //swal("Update Successfully!", "You clicked the button!", "success");
                //swal({
                //    title: "Update Successfully!",
                //    imageUrl: "/Content/SweetAlert/images/thumbs-up.jpg"
                //});
            } else {
                //alert("Duplicate data will not create!");
                swal("warning!", "Duplicate data will not create!", "error");
            }

            frien.editMode = false;

            //Grid view load 
            var companyid = $('#txtcompid').val();
            var transType = $('#transactionType option:selected').val();
            var transMonthYear = $('#hiddentxt_TransMonthYear').val();
            var transNo = $('#transNO').val();

            $http.get('/api/ApiBuyBuyReturnController/GetItemList/', {
                params: {
                    cid: companyid,
                    tType: transType,
                    myear: transMonthYear,
                    memoNO: transNo
                }
            }).success(function (data) {
                if (data[0].count == 1) {
                    $scope.BuyBuyReturnData = null;
                } else {
                    $scope.BuyBuyReturnData = data;
                }
            });
            $scope.loading = false;

        }).error(function (data) {
            $scope.error = "An Error has occured while Saving Friend! " + data;
            $scope.loading = false;

        });
    };



    //Delete grid level data.
    $scope.deleteItem = function () {
        $scope.loading = true;
        var id = this.testitem.ID;

        this.testitem.TRANSDT = $('#transactionDate').val();
        //this.testitem.PATIENTTP = $('#patientType option:selected').val();
        //this.testitem.PATIENTID = $('#patientId').val();
        this.testitem.SupplierName = $('#supplierName').val();
        this.testitem.DepartmentName = $('#departmentName').val();
        //this.testitem.PatientName = $('#patientName').val();

        this.testitem.COMPID = $('#txtcompid').val();
        this.testitem.INSUSERID = $('#txtInsertUserid').val();
        this.testitem.INSLTUDE = $('#latlon').val();

        //Sweet Alart Design box
        var model = this.testitem;
        swal({
            title: "Are you sure?",
            text: "You will not be able to recover this imaginary file!",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Yes, delete it!",
            cancelButtonText: "No, cancel plz!",
            closeOnConfirm: false,
            closeOnCancel: false
        }, function (isConfirm) {
            if (isConfirm) {
                deleteGridLevelData(model);
                swal("Deleted!", "Your imaginary file has been deleted.", "success");
            } else {
                swal("Cancelled", "Your imaginary file is safe :)", "error");
            }
        });

        //$http.post('/api/ApiBuyBuyReturnController/grid/DeleteData/', this.testitem).success(function (data) {

        //    $.each($scope.BuyBuyReturnData, function (i) {
        //        if ($scope.BuyBuyReturnData[i].ID === id) {
        //            $scope.BuyBuyReturnData.splice(i, 1);
        //            return false;
        //        }
        //    });
        //    $scope.loading = false;
        //    alert("Delete Successfully!!");
        //}).error(function (data) {
        //    $scope.error = "An Error has occured while delete posts! " + data;
        //    $scope.loading = false;
        //});

    };


    function deleteGridLevelData(model) {
        $http.post('/api/ApiBuyBuyReturnController/grid/DeleteData/', model).success(function (data) {

            //$.each($scope.BuyBuyReturnData, function(i) {
            //    if ($scope.BuyBuyReturnData[i].ID === id) {
            //        $scope.BuyBuyReturnData.splice(i, 1);
            //        return false;
            //    }
            //});
            //$scope.loading = false;

            //Grid view load 
            var companyid = $('#txtcompid').val();
            var transType = $('#transactionType option:selected').val();
            var transMonthYear = $('#hiddentxt_TransMonthYear').val();
            var transNo = $('#transNO').val();

            $http.get('/api/ApiBuyBuyReturnController/GetItemList/', {
                params: {
                    cid: companyid,
                    tType: transType,
                    myear: transMonthYear,
                    memoNO: transNo
                }
            }).success(function (data) {
                if (data[0].count == 1) {
                    $scope.BuyBuyReturnData = null;
                } else {
                    $scope.BuyBuyReturnData = data;
                }
                $scope.loading = false;
            });

        }).error(function (data) {
            $scope.error = "An Error has occured while delete posts! " + data;
            $scope.loading = false;
        });
    }














    $scope.quantity = function (value) {

        var qty = this.testitem.QTY;
        var rate = this.testitem.RATE;
        $('.gridQty').val(qty);
        $('.gridRate').val(rate);
        var tottxtAmt = (qty * rate);
        this.testitem.AMOUNT = tottxtAmt;

        $('.gridAmount').val(tottxtAmt);
    };


    $scope.rate = function (value) {

        var qty = this.testitem.QTY;
        var rate = this.testitem.RATE;
        $('.gridQty').val(qty);
        $('.gridRate').val(rate);
        var tottxtAmt = (qty * rate);
        this.testitem.AMOUNT = tottxtAmt;

        $('.gridAmount').val(tottxtAmt);
    };












    $scope.GetSummOfAmount = function (BuyBuyReturnData) {
        var summ = 0;
        for (var i in BuyBuyReturnData) {
            summ = summ + Number(BuyBuyReturnData[i].AMOUNT);
        }

        var gridTotalAmount = document.getElementById('gridTotalAmount').innerHTML;
        $("#txtMst_TotalAmount").val(gridTotalAmount);
        //$("#txtMst_NetAmount").val(gridTotalAmount);
        document.getElementById('txtMst_VatAmount').value = (document.getElementById('txtMst_TotalAmount').value * (document.getElementById('txtMst_VatRT').value / 100)).toFixed(2);
        document.getElementById('txtMst_NetAmount').value = (parseFloat(document.getElementById('txtMst_TotalAmount').value) + parseFloat(document.getElementById('txtMst_VatAmount').value) - parseFloat(document.getElementById('txtMst_DiscAmt').value)).toFixed(2);

        return summ;
    };








});