package br.com.bmnv.portalaluno.app;

import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.support.design.widget.NavigationView;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.squareup.picasso.Picasso;

import static br.com.bmnv.portalaluno.app.R.id.imageView;

public class HomeActivity extends AppCompatActivity
        implements NavigationView.OnNavigationItemSelectedListener {
    String loginUsuario, id_aluno, curso, matricula, nome, dt_nasc, cpf, senha, foto,email,nomeCurso,nome_turma,genero,email_institucional;
    String url;
    TextView nome_pessoa, curso_pessoa;
    ImageView image_user;
    private Bitmap bitmap;

    private Uri filePath;
    private int PICK_IMAGE_REQUEST = 1;

    LinearLayout layout;

    SharedPreferences preferences;

    @Override
    protected void onCreate(Bundle savedInstanceState) {


        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
        drawer.setDrawerListener(toggle);
        toggle.syncState();

        NavigationView navigationView = (NavigationView) findViewById(R.id.nav_view);

        View nav = navigationView.getHeaderView(0);

        preferences = PreferenceManager.getDefaultSharedPreferences(this);

        findViews(nav);

    }

    @Override
    protected void onResume() {
        super.onResume();

        id_aluno = preferences.getString("id_aluno", "");
        email = preferences.getString("email", "");
        curso = preferences.getString("nome_curso", "");
        matricula = preferences.getString("matricula", "");
        nome = preferences.getString("nome", "");
        dt_nasc = preferences.getString("dt_nasc", "");
        cpf = preferences.getString("cpf", "");
        nome_turma = preferences.getString("nome_turma","");
        senha = preferences.getString("senha", "");
        genero = preferences.getString("genero","");
        email_institucional = preferences.getString("email_institucional","");
        foto = preferences.getString("foto", "");

        url = foto;

        Picasso.with(this)
                .load(url)
                .resize(120,100)
                .centerCrop()
                .transform(new CircleTransform())
                .into(image_user);

        nome_pessoa.setText(nome);
        curso_pessoa.setText(curso);
    }

    private void findViews(View nav) {
        nome_pessoa = (TextView)nav.findViewById(R.id.nome_pessoa);
        curso_pessoa = (TextView)nav.findViewById(R.id.curso_pessoa);
        image_user = (ImageView)nav.findViewById(imageView);
    }

    @Override
    public void onBackPressed() {
        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        if (drawer.isDrawerOpen(GravityCompat.START)) {
            drawer.closeDrawer(GravityCompat.START);
        } else {
            super.onBackPressed();
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.home, menu);
        return true;
    }

    @SuppressWarnings("StatementWithEmptyBody")
    @Override
    public boolean onNavigationItemSelected(MenuItem item) {
        // Handle navigation view item clicks here.
        int id = item.getItemId();

        if(id == R.id.nav_inicio){

        } else if (id == R.id.nav_acompanhamento) {

        } else if (id == R.id.nav_anotacao) {

        } else if (id == R.id.nav_biblioteca) {

        } else if (id == R.id.nav_meu_perfil) {

        } else if (id == R.id.nav_meus_livros) {

        } else if (id == R.id.nav_sair) {

        }

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        drawer.closeDrawer(GravityCompat.START);
        return true;
    }

    public void sair(MenuItem item) {
        Intent intent = new Intent(HomeActivity.this, MainActivity.class);
        loginUsuario = null;
        id_aluno = null;
        curso = null;
        startActivity(intent);
        finish();
    }

    public void chamarAgenda(MenuItem item) {
        Intent intent = new Intent(this, AgendaActivity.class);
        intent.putExtra("id_aluno",id_aluno);
        startActivity(intent);
    }

    public void AbrirMeuPerfil(MenuItem item) {

        Intent meuPerfil = new Intent(HomeActivity.this, MeuPerfilActivity.class);

        preferences.edit().putString("id_aluno",id_aluno).commit();
        preferences.edit().putString("nome_curso", curso).commit();
        preferences.edit().putString("matricula", matricula).commit();
        preferences.edit().putString("nome", nome).commit();
        preferences.edit().putString("dt_nasc", dt_nasc).commit();
        preferences.edit().putString("cpf", cpf).commit();
        preferences.edit().putString("nome_turma", nome_turma).commit();
        preferences.edit().putString("senha", senha).commit();
        preferences.edit().putString("genero", genero).commit();
        preferences.edit().putString("email_institucional", email_institucional).commit();
        preferences.edit().putString("foto", foto).commit();


        startActivity(meuPerfil);

    }

    public void AbrirRendimento(MenuItem item) {

        Intent rendimento = new Intent(HomeActivity.this, RendimentoActivity.class);

        preferences.edit().putString("id_aluno",id_aluno).commit();
        preferences.edit().putString("nome_curso", curso).commit();
        preferences.edit().putString("matricula", matricula).commit();
        preferences.edit().putString("nome", nome).commit();
        preferences.edit().putString("dt_nasc", dt_nasc).commit();
        preferences.edit().putString("cpf", cpf).commit();
        preferences.edit().putString("nome_turma", nome_turma).commit();
        preferences.edit().putString("senha", senha).commit();
        preferences.edit().putString("genero", genero).commit();
        preferences.edit().putString("email_institucional", email_institucional).commit();
        preferences.edit().putString("foto", foto).commit();


        startActivity(rendimento);

    }




    public void selecionaFoto(View view) {


       Intent intent = new Intent(HomeActivity.this, MudarFoto.class);

        preferences.edit().putString("id_aluno",id_aluno).commit();
        preferences.edit().putString("nome_curso", curso).commit();
        preferences.edit().putString("matricula", matricula).commit();
        preferences.edit().putString("nome", nome).commit();
        preferences.edit().putString("dt_nasc", dt_nasc).commit();
        preferences.edit().putString("cpf", cpf).commit();
        preferences.edit().putString("nome_turma", nome_turma).commit();
        preferences.edit().putString("senha", senha).commit();
        preferences.edit().putString("genero", genero).commit();
        preferences.edit().putString("email_institucional", email_institucional).commit();
        preferences.edit().putString("foto", foto).commit();


        startActivity(intent);

    }

    public void AbrirBiblioteca(MenuItem item) {

        Intent abriirBibli = new Intent(HomeActivity.this, Biblioteca.class);
        startActivity(abriirBibli);
    }
}