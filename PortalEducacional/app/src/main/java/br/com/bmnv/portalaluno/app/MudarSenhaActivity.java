package br.com.bmnv.portalaluno.app;

import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.AsyncTask;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class MudarSenhaActivity extends AppCompatActivity {
    EditText edt_cpf;
    Button btn_busca_cpf;

    String url = "";
    String parametros = "";
    View view;
    Context context;
    SharedPreferences preferences;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_mudar_senha);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        FloatingActionButton fab = (FloatingActionButton) findViewById(R.id.fab);
        fab.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Snackbar.make(view, "Replace with your own action", Snackbar.LENGTH_LONG)
                        .setAction("Action", null).show();
            }
        });
        getSupportActionBar().setDisplayHomeAsUpEnabled(true);
        edt_cpf = (EditText)findViewById(R.id.edt_cpf);
        btn_busca_cpf = (Button) findViewById(R.id.btn_busca_cpf);
        getAplication();
        preferences = PreferenceManager.getDefaultSharedPreferences(this);
        context = this;
    }

    private void getAplication() {
        btn_busca_cpf.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                ConnectivityManager connMgr = (ConnectivityManager)context.getSystemService(Context.CONNECTIVITY_SERVICE);
                NetworkInfo networkInfo = connMgr.getActiveNetworkInfo();
                if (networkInfo != null && networkInfo.isConnected()){

                    String cpf = edt_cpf.getText().toString();

                    if(cpf.isEmpty()){
                        Toast.makeText(context, "Digite o CPF, por favor...", Toast.LENGTH_LONG).show();

                    }else{

                        url =  context.getString(R.string.link)+"esqueci_minha_senha.php";

                        parametros = "cpf=" + cpf;

                        new MudarSenhaActivity.SolicitaDados().execute(url);

                    }
                }else{
                    Snackbar.make(v, "Sua internet já era. Traga ela de volta, a gente te espera!", Snackbar.LENGTH_INDEFINITE)
                            .setAction("Fechar", new View.OnClickListener() {
                                        @Override
                                        public void onClick(View v) {
                                            Intent intent = new Intent(context, MainActivity.class);
                                            startActivity(intent);
                                        }
                                    }
                            ).show();

                }

            }
        });
    }


    private class SolicitaDados extends AsyncTask<String, Void, String> {

        ProgressDialog progressDialog;
        @Override
        protected void onPreExecute() {
            super.onPreExecute();

            progressDialog = ProgressDialog.show(context, "Aguarde...", "Estamos Trabalhando");

        }

        @Override
        protected String doInBackground(String... urls){

            return Conexao.postDados(urls[0], parametros);

        }

        // onPostExecute displays the results of the AsyncTask.
        @Override
        protected void onPostExecute(String resultado){


            progressDialog.dismiss();

            if(resultado.contains("cpf_ok")){

                String[] dados = resultado.split(",");

                Intent resultaSenha = new Intent(context, ViewSenha.class);

               resultaSenha.putExtra("senha", dados[1]);

                startActivity(resultaSenha);

            }else{

                Toast.makeText(context, "CPF INVÁLIDO", Toast.LENGTH_LONG).show();

            }

        }

    }

}
