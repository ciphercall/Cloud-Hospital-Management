var SaleSaleReturnUseApp = angular.module("SaleSaleReturnUseApp", ['ui.bootstrap']);

SaleSaleReturnUseApp.controller("ApiSaleSaleReturnUseController", function ($scope, $http) {

    $scope.loading = false;
    $scope.addMode = false;


    $scope.search = function (event) {
        $scope.loading = false;
        event.preventDefault();

        var patientName = $('#patientName').val();
        var patientType = $('#patientType').val();
        var patientID = $('#patientId').val();

        var companyid = $('#txtcompid').val();
        var transNo = $("#transNO").val();
        var transactionType = $("#transactionType option:selected").val();
        var transMonthYear = $('#hiddentxt_TransMonthYear').val();

        if (companyid != "" && transNo != "" && transactionType != "" && transMonthYear != "" && patientName != "" && patientType != "" && patientID != "") {

            //Grid view load
            $http.get('/api/ApiSaleSaleReturnUseController/GetItemList/', {
                params: {
                    cid: companyid,
                    tType: transactionType,
                    myear: transMonthYear,
                    memoNO: transNo
                }
            }).success(function (data) {
                if (data[0].count == 1) {
                    $scope.SaleSaleReturnUseData = null;
                } else {
                    $scope.SaleSaleReturnUseData = data;
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
                     '/SaleSaleReturnUse/GetPaymentInfo', { "Companyid": companyid, "TransNo": transNo, "TransactionType": transactionType, "TransMonthYear": transMonthYear },
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





    //Delete grid level data.
    $scope.deleteItem = function () {

        $scope.loading = true;
        var id = this.testitem.ID;

        this.testitem.TRANSDT = $('#transactionDate').val();
        this.testitem.PATIENTTP = $('#patientType').val();
        this.testitem.PATIENTID = $('#patientId').val();
        this.testitem.DepartmentName = $('#departmentName').val();
        this.testitem.PatientName = $('#patientName').val();

        this.testitem.COMPID = $('#txtcompid').val();
        this.testitem.INSUSERID = $('#txtInsertUserid').val();
        this.testitem.INSLTUDE = $('#latlon').val();

        this.testitem.TOTAMT = $('#txtMst_TotalAmount').val();
        this.testitem.VATRT = $('#txtMst_VatRT').val();
        this.testitem.VATAMT = $('#txtMst_VatAmount').val();
        this.testitem.DISCOUNT = $('#txtMst_DiscAmt').val();
        this.testitem.NETAMT = $('#txtMst_NetAmount').val();
        this.testitem.REMARKS = $('#txtMst_Remarks').val();

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

        //$http.post('/api/ApiSaleSaleReturnUseController/grid/DeleteData/', this.testitem).success(function (data) {

        //    $.each($scope.SaleSaleReturnUseData, function (i) {
        //        if ($scope.SaleSaleReturnUseData[i].ID === id) {
        //            $scope.SaleSaleReturnUseData.splice(i, 1);
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
        $http.post('/api/ApiSaleSaleReturnUseController/grid/DeleteData/', model).success(function (data) {

            //$.each($scope.SaleSaleReturnUseData, function(i) {
            //    if ($scope.SaleSaleReturnUseData[i].ID === id) {
            //        $scope.SaleSaleReturnUseData.splice(i, 1);
            //        return false;
            //    }
            //});
            //$scope.loading = false;

            //Grid view load 
            var companyid = $('#txtcompid').val();
            var transType = $('#transactionType option:selected').val();
            var transMonthYear = $('#hiddentxt_TransMonthYear').val();
            var transNo = $('#transNO').val();

            $http.get('/api/ApiSaleSaleReturnUseController/GetItemList/', {
                params: {
                    cid: companyid,
                    tType: transType,
                    myear: transMonthYear,
                    memoNO: transNo
                }
            }).success(function (data) {
                if (data[0].count == 1) {
                    $scope.SaleSaleReturnUseData = null;
                } else {
                    $scope.SaleSaleReturnUseData = data;
                }
                $scope.loading = false;
            });

        }).error(function (data) {
            $scope.error = "An Error has occured while delete posts! " + data;
            $scope.loading = false;
        });
    }








    $scope.GetSummOfAmount = function (SaleSaleReturnUseData) {
        var summ = 0;
        for (var i in SaleSaleReturnUseData) {
            summ = summ + Number(SaleSaleReturnUseData[i].AMOUNT);
        }
        return summ;
    };








});