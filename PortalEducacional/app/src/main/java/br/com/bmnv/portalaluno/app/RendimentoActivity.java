package br.com.bmnv.portalaluno.app;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.AsyncTask;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.widget.ArrayAdapter;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import com.google.gson.Gson;

import java.util.ArrayList;
import java.util.List;

public class RendimentoActivity extends AppCompatActivity {

    String id_aluno, matricula, nome, dt_nasc, cpf, senha, email_aluno, foto, genero, email_institucional, id_turma, nome_turma, dataFinal, curso, nota, materia;
    SharedPreferences preferences;
    TextView curso_aluno, nome_aluno, turma_aluno;
    Context context;
    String parametros, url = "";
    List<String> lista_materia;

    Spinner spn_materias, spn_escola;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_rendimento);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        getSupportActionBar().setDisplayHomeAsUpEnabled(true);

        preferences = PreferenceManager.getDefaultSharedPreferences(this);

        context = this;

        getExtras();
        findViews();
        buscarNoBanco();

        nome_aluno.setText(nome);
        curso_aluno.setText(curso);
        turma_aluno.setText(nome_turma);


        List<String> lstCidades = new ArrayList<>();

        lstCidades.add("127 - SENAI Prof. Vicente Amato - Jandira, SP");

        //Criar adapter para o spinner
        ArrayAdapter<String> adapter = new ArrayAdapter<String>(
                this, //contexto
                android.R.layout.simple_spinner_item,
                lstCidades
        );

        adapter.setDropDownViewResource(android.R.layout
                .simple_spinner_dropdown_item);

        //Definindo o adapter no spinner
        spn_escola.setAdapter(adapter);
    }

    private void getExtras() {

        id_aluno = preferences.getString("id_aluno", "");
        matricula = preferences.getString("matricula", "");
        nome = preferences.getString("nome", "");

        dt_nasc = preferences.getString("dt_nasc", "");
        String data[] = dt_nasc.split("-");
        dataFinal = data[2] + "/" + data[1] + "/" + data[0];

        cpf = preferences.getString("cpf", "");
        senha = preferences.getString("senha", "");
        email_aluno = preferences.getString("email", "");
        foto = preferences.getString("foto", "");
        genero = preferences.getString("genero", "");
        id_turma = preferences.getString("id_turma", "");
        email_institucional = preferences.getString("email_institucional", "");
        nome_turma = preferences.getString("nome_turma", "");
        curso = preferences.getString("nome_curso", "");

    }

    private void findViews() {

        curso_aluno = (TextView) findViewById(R.id.txt_curso_aluno);
        nome_aluno = (TextView) findViewById(R.id.txt_nome_aluno);
        turma_aluno = (TextView) findViewById(R.id.txt_turma);
        spn_materias = (Spinner) findViewById(R.id.spinner_materias);
        spn_escola = (Spinner) findViewById(R.id.spinner_escola);

    }

    private void buscarNoBanco() {

        ConnectivityManager connMgr = (ConnectivityManager)this.getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo networkInfo = connMgr.getActiveNetworkInfo();
        if (networkInfo != null && networkInfo.isConnected()){

            url =  this.getString(R.string.link)+"rendimento.php";

            parametros = "id_aluno=" + id_aluno;

            new RendimentoActivity.SolicitaDados().execute(url);

        }else{
            Toast.makeText(this, "Nenhuma Conexao foi detectada", Toast.LENGTH_LONG).show();

        }

    }

    private class SolicitaDados extends AsyncTask<String, Void, String> {
        @Override
        protected String doInBackground(String... urls){

            return Conexao.postDados(urls[0], parametros);

        }

        // onPostExecute displays the results of the AsyncTask.
        @Override
        protected void onPostExecute(String resultado){

            //Gson gson = new Gson();
           // RelatorioRendimento[] notas = gson.fromJson(resultado, RelatorioRendimento[].class);

            //teste.setText(notas[0].getNota());

            //Toast.makeText(context, resultado, Toast.LENGTH_LONG).show();

        }

    }

}
