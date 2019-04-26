$(document).ready(function () {
    //function to format the date that came from the controller
    function formatDate(date) {
        let code = parseInt(date.split('(')[1].split(')')[0]);
        let newDate = new Date(code);

        return newDate.toISOString().split('T')[0];
    }

    //return the html to create a new row with the corresponding data
    function createNewRow(row) {
        let element = `
            <tr>
                <td>
                    ${row.ProjectId}
                </td>
                <td>
                    ${formatDate(row.StartDate)}
                </td>
                <td>
                    ${row.TimeToStart < 0 ? "Started" : row.TimeToStart + " days"}
                </td>
                <td>
                    ${formatDate(row.EndDate)}
                </td>
                <td>
                    ${row.Credits}
                </td>
                <td>
                    ${row.Status === true ? "Active" : "Inactive"}
                </td>
            </tr>
        `;

        return element;
    }

    $('#userNameSelect').change(function () {
        //Clean previous table data to show the new one
        $('#userData tbody tr').remove();
    });

    //Handle the dropdown selection
    $('#selectUser').click(function () {
        let userId = $('#userNameSelect').val();
        $.ajax({
            url: '/Home/GetTableData?userId=' + userId,
            type: "GET",
            success: function (result) {

                //Add a new row per each result
                result.forEach(function (row) {
                    $('#userData tbody').append(createNewRow(row));
                });
            },
            error: function (err) {
                console.log('There was an error retrieving the information');
            }
        });
    });
});