<div class="box box-info">
  <div class="box-header with-border">
    <h3 class="box-title">订单流水号：{{ $order->no }}</h3>
    <div class="box-tools">
      <div class="btn-group pull-right" style="margin-right: 10px">
        <a href="{{ route('admin.orders.index') }}" class="btn btn-sm btn-default"><i class="fa fa-list"></i> 列表</a>
      </div>
    </div>
  </div>
  <div class="box-body">
    <table class="table table-bordered">
      <tbody>
      <tr>
        <td>买家：</td>
        <td>{{ $order->user->name }}</td>
        <td>支付时间：</td>
        <td>{{ $order->paid_at }}</td>
      </tr>
      <tr>
        <td>支付方式：</td>
        <td>{{ $order->payment_method }}</td>
        <td>支付渠道单号：</td>
        <td>{{ $order->payment_no }}</td>
      </tr>
      <tr>
        <td>收货地址</td>
        <td colspan="3">{{ $order->address['address'] }} {{ $order->address['zip'] }} {{ $order->address['contact_name'] }} {{ $order->address['contact_phone'] }}</td>
      </tr>
      <tr>
        <td rowspan="{{ $order->items->count() + 1 }}">商品列表</td>
        <td>商品名称</td>
        <td>单价</td>
        <td>数量</td>
      </tr>
      @foreach($order->items as $item)
      <tr>
        <td>{{ $item->product->title }} {{ $item->productSku->title }}</td>
        <td>￥{{ $item->price }}</td>
        <td>{{ $item->amount }}</td>
      </tr>
      @endforeach
      <tr>
        <td>订单金额：</td>
        <td colspan="3">￥{{ $order->total_amount }}</td>
      </tr>
      <tr>
        <td>订单金额：</td>
        <td>￥{{ $order->total_amount }}</td>
        <!-- 这里也新增了一个发货状态 -->
        <td>发货状态：</td>
        <td>{{ \App\Models\Order::$shipStatusMap[$order->ship_status] }}</td>
      </tr>
      <!-- 订单发货开始 -->
      <!-- 如果订单未发货，展示发货表单 -->
      @if($order->ship_status === \App\Models\Order::SHIP_STATUS_PENDING)
      <tr>
        <td colspan="4">
          <form action="{{ route('admin.orders.ship', [$order->id]) }}" method="post" class="form-inline">
            <!-- 别忘了 csrf token 字段 -->
            <input type="hidden" name="_token" value="{{ csrf_token() }}">
            <div class="form-group {{ $errors->has('express_company') ? 'has-error' : '' }}">
              <label for="express_company" class="control-label">物流公司：</label>
              <input type="text" id="express_company" name="express_company" value="" class="form-control" placeholder="输入物流公司">
              @if($errors->has('express_company'))
                @foreach($errors->get('express_company') as $msg)
                  <span class="help-block">{{ $msg }}</span>
                @endforeach
              @endif
            </div>
             <div class="form-group {{ $errors->has('express_company_code') ? 'has-error' : '' }}" style="display: none">
              <label for="express_company_code" class="control-label">物流公司代号：</label>
              <input type="hidden" id="express_company_code" name="express_company_code" value="" class="form-control" placeholder="输入物流公司编号">
              @if($errors->has('express_company_code'))
                @foreach($errors->get('express_company_code') as $msg)
                  <span class="help-block">{{ $msg }}</span>
                @endforeach
              @endif
            </div>
            <div class="form-group {{ $errors->has('express_no') ? 'has-error' : '' }}">
              <label for="express_no" class="control-label">物流单号：</label>
              <input type="text" id="express_no" name="express_no" value="" class="form-control" placeholder="输入物流单号">
              @if($errors->has('express_no'))
                @foreach($errors->get('express_no') as $msg)
                  <span class="help-block">{{ $msg }}</span>
                @endforeach
              @endif
            </div>
            <button type="submit" class="btn btn-success" id="ship-btn">发货</button>
          </form>
        </td>
      </tr>
      @else
      <!-- 否则展示物流公司和物流单号 -->
      <tr>
        <td style="display: none">物流公司代号：</td>
        <td id="express_company_code_data" style="display: none">{{ $order->ship_data['express_company_code'] }}</td>
        <td>物流公司：</td>
        <td id="express_company_data">{{ $order->ship_data['express_company'] }}</td>
        <td>物流单号：</td>
        <td id="express_no_data">{{ $order->ship_data['express_no'] }}</td>
      </tr>
      <tr>
        <td>物流详情：<button class="btn btn-sm btn-success" id="search-for-ship" type="button">查询物流详情</button></td>
        <td id="ship_data_detail"></td>
      </tr>
      @endif
      <!-- 订单发货结束 -->
      </tbody>
    </table>
  </div>
</div>
<link rel="stylesheet" type="text/css" href="/vendor/laravel-admin/laravel-admin/jquery-ui.min.css">
<script type="text/javascript" src="/vendor/laravel-admin/laravel-admin/autocomplete.js"></script>
<script type="text/javascript">
  $(function () {
    $("#search-for-ship").click(function (event) {
      event.preventDefault();
      var express_company_code = $("#express_company_code_data").text();
      var express_no = $("#express_no_data").text();
      $.ajax({
        url: '{{ route('admin.orders.getShipData') }}',
        type: 'POST',
        dataType: 'json',
        data: {express_company_code: express_company_code, express_no: express_no},
      })
      .done(function(res) {
        var html = '<ul style="list-style: none">';
        var detail = res.Traces;
        if (detail.length >= 1) {
          for (var i = detail.length - 1; i >=0; i--) {
            html += '<li>【' + detail[i].AcceptTime + '】' + detail[i].AcceptStation + '</li>';
          }
          html += '</ul>';
          $("#ship_data_detail").html(html);
        }
        

      })
      .fail(function() {
        console.log("error");
      })
      
    });
    $("#express_no").autocomplete({
      source: function (request, response) {
        var logisticCode = $("#express_no").val();
        $.ajax({
          url: '{{ route('admin.orders.getExpressCompany') }}',
          // url: 'http://api.kdniao.cc/Ebusiness/EbusinessOrderHandle.aspx'
          
          type: 'post',
          dataType: 'json',
          data: {LogisticCode: logisticCode},
        })
        .done(function(res) {
          $("#express_company").val(res.Shippers[0].ShipperName);
          $("#express_company_code").val(res.Shippers[0].ShipperCode);
        })
        .fail(function() {
          console.log("error");
        })
        
      }
    });
  });
</script>