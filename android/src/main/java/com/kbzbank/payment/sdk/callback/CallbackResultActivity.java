package com.kbzbank.payment.sdk.callback;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;

import com.kbzbank.payment.KBZPay;
import com.ymkj.flutter_kbz_pay.FlutterKbzPayPlugin;

public class CallbackResultActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Intent intent = getIntent();
        int result = intent.getIntExtra(KBZPay.EXTRA_RESULT, 0);
        if (result == KBZPay.COMPLETED) {
            Log.d("KBZPay", "pay success!");
            String orderId = intent.getStringExtra(KBZPay.EXTRA_ORDER_ID);
            FlutterKbzPayPlugin.sendPayStatus(result, orderId);
        } else {
            String failMsg = intent.getStringExtra(KBZPay.EXTRA_FAIL_MSG);
            Log.d("KBZPay", "pay fail, fail reason = " + failMsg);
            String orderId = intent.getStringExtra(KBZPay.EXTRA_ORDER_ID);
            FlutterKbzPayPlugin.sendPayStatus(result, orderId);
        }
        finish();
    }
}
