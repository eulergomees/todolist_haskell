module Main where

import System.Exit


data Tarefa = Tarefa String deriving(Show)

adicionarTarefa :: [Tarefa] -> IO [Tarefa]
adicionarTarefa tarefas = do
    putStrLn "Digite a descrição da nova tarefa:"
    desc <- getLine
    let novaTarefa = Tarefa desc
    return (tarefas ++ [novaTarefa])



menu :: [Tarefa] -> IO ()
menu tarefas = do
    putStrLn "---Menu---"
    putStrLn "1. Adicionar tarefa"
    putStrLn "2. Remover tarefa"
    putStrLn "3. Exibir tarefas"
    putStrLn "4. Sair"
    putStrLn "Escolha uma opção:"
    opcao <- getLine
    case opcao of
        "1" -> do
            novasTarefas <- adicionarTarefa tarefas
            menu novasTarefas
        "2" -> do
            putStrLn"2"
        "3" -> do
            putStrLn"3"
        "4" -> do
            putStrLn "Saindo do programa"
            exitSuccess
        _   -> do
            putStrLn "Opção inválida!"
            menu tarefas


main::IO()
main = do
    menu[]