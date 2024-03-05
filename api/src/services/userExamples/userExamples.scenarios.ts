import type { Prisma, UserExample } from '@prisma/client'
import type { ScenarioData } from '@redwoodjs/testing/api'

export const standard = defineScenario<Prisma.UserExampleCreateArgs>({
  userExample: {
    one: { data: { email: 'String143457' } },
    two: { data: { email: 'String5183262' } },
  },
})

export type StandardScenario = ScenarioData<UserExample, 'userExample'>
