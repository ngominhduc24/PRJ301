async function getAllProvinces() {
    const url = 'https://provinces.open-api.vn/api/?depth=3';
    const response = await fetch(url);
    const provinces = await response.json();
    return provinces;
}

async function loadPage() {
    const provinces = await getAllProvinces();
    const provincesSelect = document.getElementById('province');
    const districtsSelect = document.getElementById('district');
    const wardsSelect = document.getElementById('ward');
    provinces.forEach(province => {
        const option = document.createElement('option');
        option.value = province.code;
        option.innerText = province.name;
        provincesSelect.appendChild(option);
    });
    provincesSelect.addEventListener('change', () => {
        const province = provinces.find(province => province.code == provincesSelect.value);
        districtsSelect.innerHTML = '';
        wardsSelect.innerHTML = '';
        province.districts.forEach(district => {
            const option = document.createElement('option');
            option.value = district.code;
            option.innerText = district.name;
            districtsSelect.appendChild(option);
        });
    });
    districtsSelect.addEventListener('change', () => {
        const province = provinces.find(province => province.code == provincesSelect.value);
        const district = province.districts.find(district => district.code == districtsSelect.value);
        wardsSelect.innerHTML = '';
        district.wards.forEach(ward => {
            const option = document.createElement('option');
            option.value = ward.name;
            option.innerText = ward.name;
            wardsSelect.appendChild(option);
        });
    });
}