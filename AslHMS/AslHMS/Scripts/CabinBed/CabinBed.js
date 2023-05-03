var CabinBedApp = angular.module("CabinBedApp", ['ui.bootstrap']);

CabinBedApp.controller("ApiCabinBedController", function($scope, $http) {

    $scope.add = function(event) {
        $scope.loading = true;

        event.preventDefault();


        var compid = $('#txtcompid').val();

        var PatientYID = $("#PatientYearID").val();

        var inUserID = $('#InUserID').val();

        var insltude = $('#latlonPos').val();

        $http.get('/api/ApiCabinBed/GetData/', {
            params: {
                Compid: compid,

                Patientyearid: PatientYID,


                InUserID: inUserID,
                InsLtude: insltude

            }
        }).success(function(data) {
            var CabinID = data[0].CabinID;


            if (CabinID != 0) {
                $scope.ICBData = data;
                $('#EFDT').val("");
                $('#EFTM').val("");
                $('#EFDT').attr('disabled', false);
                $('#EFTM').attr('disabled', false);

            } else {
                $scope.ICBData = null;
                $('#EFDT').val(data[0].EFDT);
                $('#EFTM').val(data[0].EFTM);

                $('#EFDT').attr('disabled', true);
                $('#EFTM').attr('disabled', true);

            }

            //$('#PatientID').val(data[0].PatientID);

            $scope.loading = false;

        });

    };


    $scope.addrow = function() {
        $scope.loading = false;
        event.preventDefault();

        this.newChild.COMPID = $('#txtcompid').val();


        this.newChild.PatientYear = $("#PatientYear").val();
        this.newChild.PatientYearID = $("#PatientYearID").val();

        this.newChild.CabinType = $("#CabinType").val();
        this.newChild.CabinHead = $("#CabinHead").val();
        this.newChild.EFDT = $("#EFDT").val();

        this.newChild.EFTM = $("#EFTM").val();
        this.newChild.ETDT = $("#ETDT").val();
        this.newChild.ETTM = $("#ETTM").val();


        //this.newChild.Pcntr = $("#Pcntr").val();

        this.newChild.TotalHours = $("#TotalHours").val();

        this.newChild.TotalDays = $("#TotalDays").val();

        this.newChild.INSUSERID = $('#InUserID').val();
        this.newChild.INSLTUDE = $('#latlonPos').val();

        if (this.newChild.PatientYearID != "") {
            $http.post('/api/grid/IcbChild', this.newChild).success(function(data, status, headers, config) {

                var compid = $('#txtcompid').val();

                var PatientYID = $("#PatientYearID").val();

                var inUserID = $('#InUserID').val();

                var insltude = $('#latlonPos').val();

                $http.get('/api/ApiCabinBed/GetData/', {
                    params: {
                        Compid: compid,

                        Patientyearid: PatientYID,


                        InUserID: inUserID,
                        InsLtude: insltude

                    }
                }).success(function(data) {
                    var CabinID = data[0].CabinID;


                    if (CabinID != 0) {
                        $scope.ICBData = data;

                    } else {
                        $scope.ICBData = null;
                        $('#EFDT').val(data[0].EFDT);
                        $('#EFTM').val(data[0].EFTM);

                    }

                    //$('#PatientID').val(data[0].PatientID);

                    $scope.loading = false;

                });


                if (data.CabinID != 0) {

                    $("#Remarks").val("");
                    $("#CabinType").val("");
                    $('#EFDT').val("");
                    $('#EFTM').val("");
                    $('#ETDT').val("");

                    $('#ETTM').val("");
                    $('#TotalHours').val("0");
                    $('#TotalDays').val("0");


                    //$scope.Opdata.push({ ID: data.ID, TCatId: data.TCatId, ReferPCNT: data.ReferPCNT, Remarks: data.Remarks });
                } else {
                    //$("#TestName").val("");
                    //$("#TCatId").val("");
                    //$('#TestID').val("");
                    //$('#HiddentCatId').val("");
                    //$('#Amount').val("");

                    //$('#Pcntd').val("");
                    //$('#Discr').val("");
                    alert("duplicate name will not create");
                }
                $('#EFDT').attr('disabled', false);
                $('#EFTM').attr('disabled', false);

            }).error(function() {
                $scope.error = "An Error has occured while loading posts!";
                $scope.loading = false;
            });

        } else {


            alert("Enter Master Data First");
        }

    };

    $scope.toggleEdit = function() {
        this.item.editMode = !this.item.editMode;

    };

    $scope.cancel = function() {
        this.item.editMode = !this.item.editMode;
        var compid = $('#txtcompid').val();

        var PatientYID = $("#PatientYearID").val();

        var inUserID = $('#InUserID').val();

        var insltude = $('#latlonPos').val();

        $http.get('/api/ApiCabinBed/GetData/', {
            params: {
                Compid: compid,

                Patientyearid: PatientYID,


                InUserID: inUserID,
                InsLtude: insltude

            }
        }).success(function(data) {
            var CabinID = data[0].CabinID;


            if (CabinID != 0) {
                $scope.ICBData = data;
                $('#EFDT').val("");
                $('#EFTM').val("");
                $('#EFDT').attr('disabled', false);
                $('#EFTM').attr('disabled', false);

            } else {
                $scope.ICBData = null;
                $('#EFDT').val(data[0].EFDT);
                $('#EFTM').val(data[0].EFTM);

                $('#EFDT').attr('disabled', true);
                $('#EFTM').attr('disabled', true);

            }

            //$('#PatientID').val(data[0].PatientID);

            $scope.loading = false;

        });


    };
    $scope.save = function() {
        // alert("Edit");
        $scope.loading = true;
        var frien = this.item;
        this.item.COMPID = $('#txtcompid').val();
        this.item.PatientYear = $('#PatientYear').val();
        this.item.PatientYearID = $('#PatientYearID').val();


        $http.post('/api/ApiCabinBed/SaveData', this.item).success(function(data) {
            if (data.CabinID != 0) {
                alert("Saved Successfully!!");
            } else {
                alert("Duplicate data entered");
            }

            frien.editMode = false;

            var compid = $('#txtcompid').val();

            var PatientYID = $("#PatientYearID").val();

            var inUserID = $('#InUserID').val();

            var insltude = $('#latlonPos').val();

            $http.get('/api/ApiCabinBed/GetData/', {
                params: {
                    Compid: compid,

                    Patientyearid: PatientYID,


                    InUserID: inUserID,
                    InsLtude: insltude

                }
            }).success(function(data) {
                var CabinID = data[0].CabinID;


                if (CabinID != 0) {
                    $scope.ICBData = data;
                    $('#EFDT').val("");
                    $('#EFTM').val("");
                    $('#EFDT').attr('disabled', false);
                    $('#EFTM').attr('disabled', false);

                } else {
                    $scope.ICBData = null;
                    $('#EFDT').val(data[0].EFDT);
                    $('#EFTM').val(data[0].EFTM);

                    $('#EFDT').attr('disabled', true);
                    $('#EFTM').attr('disabled', true);

                }


            });

            $scope.loading = false;
        }).error(function(data) {
            $scope.error = "An Error has occured while Saving Friend! " + data;
            $scope.loading = false;

        });
    };

    $scope.myFunct = function (e, myValue) {
        var charCode = (e.which) ? e.which : e.keyCode;        
        // do something with myValue
    
        //var changedText = this.item.EFDT;
        //var changedText2 = this.item.ETDT;
        //var Eftm = this.item.EFTM;
        //var Ettm = value;
        //var txtBox = document.getElementById('gridTotalDays');
        //var txtBox2 = document.getElementById('gridTotalHours');

        //$.getJSON(
        //      '/api/DaysCalculate', { "ChangedText": changedText, "ChangedText2": changedText2, "EFTM": Eftm, "ETTM": Ettm },
        //      function (result) {

        //          txtBox.value = result[0];
        //          txtBox2.value = result[1];

                  
        //      });


    };

});

//CabinBedApp.directive('myEnter', function () {
//    return function (scope, element, attrs) {
//        element.bind("keydown keypress", function (event) {
//            if (event.which === 9) {
//                var changedText = this.item.EFDT;
//                    var changedText2 = this.item.ETDT;
//                    var Eftm = this.item.EFTM;
//                    var Ettm = this.item.ETTM;
//                    var txtBox = document.getElementById('gridTotalDays');
//                    var txtBox2 = document.getElementById('gridTotalHours');

//                    $.getJSON(
//                          '/api/DaysCalculate', { "ChangedText": changedText, "ChangedText2": changedText2, "EFTM": Eftm, "ETTM": Ettm },
//                          function (result) {

//                              txtBox.value = result[0];
//                              txtBox2.value = result[1];

//                              //document.getElementById('Remarks').focus();
//                          });
//            }
//        });
//    };
//});