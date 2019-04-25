$(document).ready(function () {   
    function formatDate(date) {
        let code = parseInt(date.split('(')[1].split(')')[0]);
        let newDate = new Date(code);

        return newDate.toISOString().split('T')[0];
    }

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

    //Handle the dropdown selection
    $('#selectUser').click(function () {
        let userId = $('#userNameSelect').val();
        $.ajax({
            url: '/Home/GetTableData?userId=' + userId,
            type: "GET",
            success: function (result) {
                $('#userData tbody tr').remove();
                result.forEach(function (row) {
                    $('#userData tbody').append(createNewRow(row));
                });
            },
            error: function (err) {
                console.log('error');
            }
        });
    });
});