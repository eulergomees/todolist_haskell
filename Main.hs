module Main where

import System.Exit


newtype Tarefa = Tarefa String deriving(Show)

adicionarTarefa :: [Tarefa] -> IO [Tarefa]
adicionarTarefa tarefas = do
    putStrLn "Digite a descrição da nova tarefa:"
    desc <- getLine
    let novaTarefa = Tarefa desc
    return (tarefas ++ [novaTarefa])

removerTarefa :: [Tarefa] -> IO [Tarefa]
removerTarefa [] = do
    putStrLn "Nenhuma tarefa para remover."
    return []
removerTarefa tarefas = do
    putStrLn "Qual tarefa deseja remover ?"
    mapM_ (\(i, Tarefa desc) -> putStrLn (show i ++ ". " ++ desc)) (zip [1..] tarefas)
    entrada <- getLine
    let indice = read entrada :: Int
    if indice < 1 || indice > length tarefas
        then do
            putStrLn "Não existe essa tarefa!"
            return tarefas
        else do
            let (antes, _:depois) = splitAt (indice - 1) tarefas
            putStrLn "Tarefa removida!"
            return (antes ++ depois)


exibirTarefas :: [Tarefa] -> IO ()
exibirTarefas [] = putStrLn "Nenhuma tarefa cadastrada."
exibirTarefas tarefas = do
    putStrLn "Lista de tarefas:"
    mapM_ (\(i, Tarefa desc) -> putStrLn (show i ++ ". " ++ desc)) (zip [1..] tarefas)


menu :: [Tarefa] -> IO ()
menu tarefas = do
    putStrLn" "
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
            novasTarefas <- removerTarefa tarefas
            menu novasTarefas
        "3" -> do
            exibirTarefas tarefas
            menu tarefas
        "4" -> do
            putStrLn "Saindo do programa"
            exitSuccess
        _   -> do
            putStrLn "Opção inválida!"
            menu tarefas


main::IO()
main = do
    menu[]