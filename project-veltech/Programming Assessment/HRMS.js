document.addEventListener('DOMContentLoaded', () => {
    const employeeForm = document.getElementById('employeeForm');
    const employeesList = document.getElementById('employees');

    const API_URL = 'http://localhost:5000'; // Adjust according to your API URL

    employeeForm.addEventListener('submit', async (event) => {
        event.preventDefault();
        const employeeId = document.getElementById('employeeId').value;
        const firstName = document.getElementById('firstName').value;
        const lastName = document.getElementById('lastName').value;
        const email = document.getElementById('email').value;
        const departmentId = document.getElementById('departmentId').value;
        const roleId = document.getElementById('roleId').value;

        const payload = { first_name: firstName, last_name: lastName, email, department_id: departmentId, role_id: roleId };

        if (employeeId) {
            // Update existing employee
            await fetch(`${API_URL}/employee/${employeeId}`, {
                method: 'PUT',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(payload)
            });
        } else {
            // Add new employee
            await fetch(`${API_URL}/employee`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
