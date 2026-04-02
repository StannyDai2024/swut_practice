function name(params:number): (n: number) => number {
    let result: number = params + 1;
    return (n : number) => {
        return result + n;
    }
}



type FnType = (n: number) => number;




function add(a: number, b: number): string {
    return `${a + b}`;
}

type F = (a: number, b: number) => string;

const add2 = (a: number, b: number): string => {
    return 'string'
}




const fn2: FnType = (params: number): number => {
    let result: number = params + 1;
    return result;
}