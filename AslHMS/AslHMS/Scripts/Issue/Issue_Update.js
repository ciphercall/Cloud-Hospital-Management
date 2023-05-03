﻿var IssueApp = angular.module("IssueApp", ['ui.bootstrap']);

IssueApp.controller("ApiIssueController", function ($scope, $http) {

    $scope.loading = false;
    $scope.addMode = false;


    $scope.search = function (event) {
        $scope.loading = false;
        event.preventDefault();

        var departmentNameFrom = $('#departmentName_From').val();
        var departmentNameTo = $('#departmentName_To').val();

        var companyid = $('#txtcompid').val();
        var transNo = $("#transNO").val();
        var transactionType = $("#transactionType").val();
        var transMonthYear = $('#hiddentxt_TransMonthYear').val();

        if (companyid != "" && transNo != "" && transactionType != "" && transMonthYear != "" && departmentNameFrom != "" && departmentNameTo != "") {

            //Grid view load
            $http.get('/api/ApiIssueController/GetItemList/', {
                params: {
                    cid: companyid,
                    tType: transactionType,
                    myear: transMonthYear,
                    memoNO: transNo
                }
            }).success(function (data) {
                if (data[0].count == 1) {
                    $scope.IssueData = null;
                } else {
                    $scope.IssueData = data;
                }
                $scope.loading = false;
            });

            //Get Payment Information
            var txtMst_TotalAmount = document.getElementById('txtMst_TotalAmount');
            var txtMst_VatAmount = document.getElementById('txtMst_VatAmount');
            var txtMst_DiscAmt = document.getElementById('txtMst_DiscAmt');
            var txtMst_NetAmount = document.getElementById('txtMst_NetAmount');
            var txtMst_Remarks = document.getElementById('txtMst_Remarks');

            $.getJSON(
                     '/Issue/GetPaymentInfo', { "Companyid": companyid, "TransNo": transNo, "TransactionType": transactionType, "TransMonthYear": transMonthYear },
                     function (myData) {
                         txtMst_TotalAmount.value = myData.TOTAMT;
                         txtMst_VatAmount.value = myData.VATAMT;
                         txtMst_DiscAmt.value = myData.DISCOUNT;
                         txtMst_NetAmount.value = myData.NETAMT;
                         txtMst_Remarks.value = myData.REMARKS;
                     });
        }
        else {
            swal("warning!", "Please input valid TransDate and Memo No field!", "error");
            //swal("Please input valid TransDate and Memo No field !!");
        }
    };





    $scope.toggleEdit = function () {
        this.testitem.editMode = !this.testitem.editMode;
    };



    $scope.toggleEdit_Cancel = function () {
        this.testitem.editMode = !this.testitem.editMode;

        //Grid view load
        var companyid = $('#txtcompid').val();
        var transType = $('#transactionType').val();
        var transMonthYear = $('#hiddentxt_TransMonthYear').val();
        var transNo = $('#transNO').val();

        $http.get('/api/ApiIssueController/GetItemList/', {
            params: {
                cid: companyid,
                tType: transType,
                myear: transMonthYear,
                memoNO: transNo
            }
        }).success(function (data) {
            if (data[0].count == 1) {
                $scope.IssueData = null;
            } else {
                $scope.IssueData = data;
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

            this.newChild.TRANSDT = $('#transactionDate').val();
            this.newChild.DEPTFR = $('#hiddentxt_DepartmentFrom_id').val();
            this.newChild.DEPTTO = $('#hiddentxt_DepartmentTo_id').val();

            this.newChild.DepartmentName_From_Issue = $('#departmentName_From').val();
            this.newChild.DepartmentName_To_Issue = $('#departmentName_To').val();
            this.newChild.MEDINM = $('#itemName_MEDIname').val();

            this.newChild.TRANSTP = $('#transactionType').val();
            this.newChild.TRANSMY = $('#hiddentxt_TransMonthYear').val();
            this.newChild.TRANSNO = $('#transNO').val();
            this.newChild.MEDIID = $('#hiddentxt_MEDIID').val();
            this.newChild.QTY = $('#qty').val();
            this.newChild.RATE = $('#rate').val();
            this.newChild.AMOUNT = $('#amount').val();

            if (this.newChild.MEDIID != "" && this.newChild.MEDIID != 0 && this.newChild.MEDINM != "" && this.newChild.TRANSDT != "" && this.newChild.TRANSNO != "" && this.newChild.DepartmentName_From_Issue != "" && this.newChild.DepartmentName_To_Issue != "" && this.newChild.QTY != 0 && this.newChild.QTY != "") {
                $http.post('/api/ApiIssueController/grid/addData_UpdatePage', this.newChild).success(function (data, status, headers, config) {

                    ////Disabled required field when select insert button.
                    //$("#transactionType").prop("disabled", true);
                    //$("#transaction_MonthYear_Update").prop("disabled", true);
                    //$("#transNO").prop("disabled", true);

                    //Grid view load 
                    var companyid = $('#txtcompid').val();
                    var transType = $('#transactionType').val();
                    var transMonthYear = $('#hiddentxt_TransMonthYear').val();
                    var transNo = $('#transNO').val();

                    $http.get('/api/ApiIssueController/GetItemList/', {
                        params: {
                            cid: companyid,
                            tType: transType,
                            myear: transMonthYear,
                            memoNO: transNo
                        }
                    }).success(function (data) {
                        if (data[0].count == 1) {
                            $scope.IssueData = null;
                        } else {
                            $scope.IssueData = data;
                        }
                        $scope.loading = false;
                    });


                    if (data.MEDIID != 0) {
                        $('#hiddentxt_MEDIID').val("");
                        $('#itemName_MEDIname').val("");
                        $('#qty').val("");
                        $('#rate').val("");
                        $('#amount').val("");
                        //swal("Create Successfully!", "You clicked the button!", "success");
                        //alert("Create Successfully !!");
                        //$scope.IssueData.push({ ID: data.ID, MCATID: data.MCATID, MEDIID: data.MEDIID, MEDINM: data.MEDINM, PHARMAID: data.PHARMAID, GHEADID: data.GHEADID });
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
                swal("warning!", "Please select valid item name first!", "error");
            }
            else {
                //alert("Please input required field !!");
                swal("warning!", "Please input required field!", "error");
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
        this.testitem.DEPTFR = $('#hiddentxt_DepartmentFrom_id').val();
        this.testitem.DEPTTO = $('#hiddentxt_DepartmentTo_id').val();

        this.testitem.DepartmentName_From_Issue = $('#departmentName_From').val();
        this.testitem.DepartmentName_To_Issue = $('#departmentName_To').val();

        this.testitem.TRANSTP = $('#transactionType').val();
        this.testitem.TRANSDT = $('#transactionDate').val();
        this.testitem.TRANSNO = $('#transNO').val();
        //this.testitem.QTY = $('#gridQtyID').val();
        //this.testitem.RATE = $('#gridRateID').val();
        //this.testitem.AMOUNT = $('#gridAmountID').val();


        $http.post('/api/ApiIssueController/grid/UpdateData', this.testitem).success(function (data) {
            if (data.MEDIID != 0) {
                //swal({
                //    title: "Update Successfully!",
                //    imageUrl: "/Content/SweetAlert/images/thumbs-up.jpg"
                //});
                //alert("Saved Successfully!!");
            } else {
                swal("warning!", "Duplicate data will not create!", "error");
                //alert("Duplicate data will not create!");
            }

            frien.editMode = false;

            //Grid view load 
            var companyid = $('#txtcompid').val();
            var transType = $('#transactionType').val();
            var transMonthYear = $('#hiddentxt_TransMonthYear').val();
            var transNo = $('#transNO').val();

            $http.get('/api/ApiIssueController/GetItemList/', {
                params: {
                    cid: companyid,
                    tType: transType,
                    myear: transMonthYear,
                    memoNO: transNo
                }
            }).success(function (data) {
                if (data[0].count == 1) {
                    $scope.IssueData = null;
                } else {
                    $scope.IssueData = data;
                }
                $scope.loading = false;
            });

        }).error(function (data) {
            $scope.error = "An Error has occured while Saving Friend! " + data;
            $scope.loading = false;

        });
    };







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



    $scope.GetSummOfAmount = function (IssueData) {
        var summ = 0;
        for (var i in IssueData) {
            summ = summ + Number(IssueData[i].AMOUNT);
        }

        var gridTotalAmount = document.getElementById('gridTotalAmount').innerHTML;
        $("#txtMst_TotalAmount").val(gridTotalAmount);
        $("#txtMst_NetAmount").val(gridTotalAmount);
        //document.getElementById('txtMst_VatAmount').value = (document.getElementById('txtMst_TotalAmount').value * (document.getElementById('txtMst_VatRT').value / 100)).toFixed(2);
        //document.getElementById('txtMst_NetAmount').value = (parseFloat(document.getElementById('txtMst_TotalAmount').value) + parseFloat(document.getElementById('txtMst_VatAmount').value) - parseFloat(document.getElementById('txtMst_DiscAmt').value)).toFixed(2);
        return summ;
    };



});