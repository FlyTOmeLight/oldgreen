//从刚安装的库里加载数据
const addressData = require('china-area-data/v4/data');
//引入lodash，实用工具库
import _ from 'lodash';
//注册一个名叫select-district的vue 组件
Vue.component('select-district', {
    //定义组件属性
    props: {
        //初始化省市区的值,在编辑时可以用到
        initValue: {
            type: Array,
            default: () => ([]),//默认为空数组
        }
    },
// 定义了这个组件内的数据
data()
{
    return {
        provinces: addressData['86'],
        cities: {},
        districts: {},
        provinceId: '',
        cityId: '',
        districtId: '',
    };
},
// 定义观察器，对应属性变更时会触发对应的观察器函数
watch: {
    provinceId(newVal)
    {
        if (!newVal) {
            this.cities = {};
            this.cityId = '';
            return;
        }
        // 将城市列表设为当前省下的城市
        this.cities = addressData[newVal];
        // 如果当前选中的城市不在当前省下，则将选中城市清空
        if (!this.cities[this.cityId]) {
            this.cityId = '';
        }
    }
,

    cityId(newVal)
    {
        if (!newVal) {
            this.districts = {};
            this.districtId = '';
            return;
        }
        this.districts = addressData[newVal];
        if (!this.districts[this.districtId]) {
            this.districtId = '';
        }
    }
,
    districtId()
    {
        this.$emit('change', [this.provinces[this.provinceId], this.cities[this.cityId], this.districts[this.districtId]]);
    }
,
}
,
// 组件初始化时会调用这个方法
created()
{
    this.setFromValue(this.initValue);
}
,
methods: {
    setFromValue(value)
    {
        value = _.filter(value);
        if (value.length === 0) {
            this.provinceId = '';
            return;
        }
        const provinceId = _.findKey(this.provinces, o => o === value[0]);
        if (!provinceId) {
            this.provinceId = '';
            return;
        }
        this.provinceId = provinceId;
        const cityId = _.findKey(addressData[provinceId], o => o === value[1]);
        if (!cityId) {
            this.cityId = '';
            return;
        }
        this.cityId = cityId;
        const districtId = _.findKey(addressData[cityId], o => o === value[2]);
        if (!districtId) {
            this.districtId = '';
            return;
        }
        this.districtId = districtId;
    }
}

});