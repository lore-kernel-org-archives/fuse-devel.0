Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649D92DC76A
	for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 21:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776805551; cv=pass; b=iDdPoMlSnMH6GN+tLjB+9nrmSCwQKjnDk8FySFNfZB2z/sv+QRlI6B78/yFsDkSdcYcn03pewTryNJGvmwWsKHd56jjDOkCp5DCyw4qsjQmq6ZABNaZdf0pF4uy+hX8DDOPwqYtHM8VjVaMXAdwoN9XnCm3+Kjenwia/NC35orA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776805551; c=relaxed/simple;
	bh=KcN0BeeI7Wn5Bm9CR5Zad70mIpeIAeZNaR+C+IrS6Vg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SqAIRTb6FQQUhR6KFH/3C7Biz9YMkq/VTz1fEABH/N68dYV6h/Sy9Buav4oIYpEjnzsOXmeES+Zx6KDN0TkE5qcwjaxbgPoSNGr5pnxqxo1puIV6d0kucS7rLfQR9pMkxLrujgcwbf4ctKXO81t2IjrjpZLvqo3YLmZJC3XgOXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B2ErkBDj; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B2ErkBDj"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43cf7683a28so3222690f8f.2
        for <fuse-devel@lists.linux.dev>; Tue, 21 Apr 2026 14:05:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776805549; cv=none;
        d=google.com; s=arc-20240605;
        b=h9XBm4jofUownun8AnwvG9ksFJ9A1hVppAsUUZmMmRi5qG/nwnOxvgSdXLIYLkKOmS
         h5xLzZ6clX0i7NRSCCig8OxfQb1qFxO5SvMFXwqRExWLUNmR2z8bomVhSi7VdKg1Lutm
         b0dBvr0BUOy8mWhHk1wmgJV8RWhtGhl/kgriAQhiWGlNpO+pu1PPCvR4DzHVbpZ2A4mO
         BkHHaosetMxq7UMbu63z+8mTdKWSQI54KCknlwZ1yUrzbwJLnK1kUJ9zOKcTL3aEaZqQ
         668/IBQ3Idf8XA8KwrnHKFr0Xg4O/pjBNmbqGRWqBiq29t46zI4JUIPBqmXOF9owS3wK
         C1OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KcN0BeeI7Wn5Bm9CR5Zad70mIpeIAeZNaR+C+IrS6Vg=;
        fh=taADOUTgClGKup0ttlFyvr9q6mU2sJaVUQSbCOWaSKQ=;
        b=Fzc1paLz9nzPrj9Ophk8lVM6pEbXuZFtZUHKMM1JKYRvpQ8MRHpyewiT4O0BFon+hA
         LXBveZy3GINpaHONo9wMkgTU2AHztnqjFDLE1BJcHIHMtyWlc6kFuM1UH7cXDAhsFmx3
         H2wB/6sbJAIL/e1wvHll1X2Uf9y7GmTGQnXVZYvDN6J1Gq0vFCTk8E8i8w3BguRmZp1E
         XpxEjRAjy+fXOQQGrM1v3qyTc8oc5kc1gC9otSRNIMus/AFMnVKNKdVxJzZeZaX/5BNb
         V2fgtChZWcKM9UViN0xJd5c1dbrHREKoSRzjZQ5Cmrq99xUSJBN2aTtzlVL1pcnuVK/C
         5Mxg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776805549; x=1777410349; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KcN0BeeI7Wn5Bm9CR5Zad70mIpeIAeZNaR+C+IrS6Vg=;
        b=B2ErkBDjCi9ilwLKI5WRJ5bZ742JAYrJHZmwoUIipafPEnmIT9EzCM5W4jiszEiWEn
         rmNRpAGYon0TcpRnekqY9uJ6itdts95lN2Q+YpWg28DJqsbwtTnaTK0R7pX1vX/4dDe7
         HisPLzMxfwonD5mMnuWPmXbPccss6uY9dPU0Whnm8Nyuao1zBryqyLbY/wkuZBwae2SZ
         h3ObRDFbZ6CSV/X14mpMP6DCX1uLRgunqhq8U9WwAGuNnG8ZSftgXWAvuvvp757egp1v
         WJ5uP3DB4e5RyKnGaIaCLmc9+KkDARlkkiuyFODM8GWMtQWjKLLJ/QnMwVwtmpk9hric
         Pwgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776805549; x=1777410349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KcN0BeeI7Wn5Bm9CR5Zad70mIpeIAeZNaR+C+IrS6Vg=;
        b=bT06xJXX01ioltcVprrPWIqi2lJPPI9643qCHGR1PdNjFZ9k04p9kXPGrPEuEM4t9u
         C60AHygZN/wN7WN6sdGQR74ZfPj/MN5jnDAWsfLJD+0UtOajdTBdi78jlzJ9kTlcCyoS
         h+ub2O0kUJZgnus/LmsSK8qVxod325v1FQkwbaBistdQaGUQD858A8EgZP56fyECJzxM
         ykmS0ErVkbKA7Nx3Wzh45hklJAWo9QsCeGQQpLiPbdSFX1nBja/se2uQPBxrml/lbMDv
         OP0wbccCzJsHRETuy2/UuF7aq3TrElnXO5NT5Jc+/YCbyTqz6vVeE6th9r84VYqyKn/S
         cJ7w==
X-Forwarded-Encrypted: i=1; AFNElJ/PYy4Axq8l44HN2QhijmnsGeIexmY6peJ2HJP0rWfr2cjEf26w9t6ZWfMtgSzj94+Zq3eTXoPG4c5M@lists.linux.dev
X-Gm-Message-State: AOJu0Yzj6biuh4U7y06t3tt6hJJiWqyRxPM5e7hFbEiTN8qVAMLexhTc
	xQy9W+EPRKK1raFZeDVB20Vb8yb+zzXz4R9cVU1oUtC/HCJf4JuSefcPcsK266TbEHL0gZFVddc
	8yF1u06oocfPjpnh8LUlydLgM1EImDMg=
X-Gm-Gg: AeBDiesAMITfoTIKUTpU+YYW0YSuQlARHGvoCEAmrlpUfpfab+0jpXbPM7nsUAgF0JB
	mqxuU5pCtAg25pQgNgbUJ+bAokvd2Q7ICwFNG8jRsom0s3TdtlUOClqKg2NVFXhN1CJmCgXkiX+
	zUxVEYQaxvJyzODH5oNjfobfw+2YKEea+gt86UhPpkJ6d7G9ceaKs/DIJgduYFjdPssLjjl2iHD
	pRHV2ghTSn/P3SZxgChG4rXqVRLXjGQKKDMBFxkERx615p2bMekec9ueA4+pOVJNPYyg3vPoHc9
	98DgdLIGJQN5CKYX5BM8PgcaCd0y/zHP/A==
X-Received: by 2002:a05:6000:258a:b0:43f:f25a:f8b8 with SMTP id
 ffacd0b85a97d-43ff25af8d9mr15600067f8f.23.1776805548480; Tue, 21 Apr 2026
 14:05:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420221637.2631478-1-joannelkoong@gmail.com>
 <CAOQ4uxhbR8AoBCUMYQntAHzo_1wjh=Qcpb1z0CE4ynfDE-ZAFQ@mail.gmail.com> <CAOQ4uxhVnzoka4QppUvmFmq3wtXSU_ahgpkNR==Gbnpm5hpUyw@mail.gmail.com>
In-Reply-To: <CAOQ4uxhVnzoka4QppUvmFmq3wtXSU_ahgpkNR==Gbnpm5hpUyw@mail.gmail.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Tue, 21 Apr 2026 14:05:36 -0700
X-Gm-Features: AQROBzB6brhVcH4-8RlD3BNe0M8SRsUmyVCKfcJmwxrmuUHOwDklxpgVnbLGuKo
Message-ID: <CAJnrk1YJ9YDTrERtNiXZ=vAHr7kKRzS7iUphQemVVXf63yt7qQ@mail.gmail.com>
Subject: Re: [PATCH v1 00/17] fuse: extend passthrough to inode operations
To: Amir Goldstein <amir73il@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, luis@igalia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 6:55=E2=80=AFAM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Tue, Apr 21, 2026 at 11:37=E2=80=AFAM Amir Goldstein <amir73il@gmail.c=
om> wrote:
> >
> > On Tue, Apr 21, 2026 at 12:18=E2=80=AFAM Joanne Koong <joannelkoong@gma=
il.com> wrote:
> > >
> > > This series extends fuse passthrough to support inode operations (get=
attr,
> > > setattr), directory readdir, and kernel-initiated open on backing fil=
es.
> > >
> > > The existing FUSE_PASSTHROUGH mode attaches a backing file to a fuse =
inode
> > > only when a passthrough file is open. This series introduces
> > > FUSE_PASSTHROUGH_INO, a stricter mode requiring one-to-one inode numb=
er
> > > mapping, which allows attaching a backing file for the lifetime of th=
e fuse
> > > inode.
> > >
> > > Future work includes passthrough for additional operations (rename, u=
nlink,
> > > readdirplus) and full subtree passthrough, which will be part of a se=
parate
> > > series.
>

Thanks for taking the time to look at this, Amir!

> Joanne,
>
> Thanks a lot for picking up my abandoned wip!
>
> Could you add a few words about the intended use case in Meta?

The main intended use case at Meta is to use passthrough to reduce
startup latency for short=E2=80=91lived services and batch jobs that need t=
o
fetch large packaged artifacts over the network. The idea is to add a
fuse-based lazy materialization layer that supports on-demand fetching
for cold data but that once the required content has been fetched
locally, can switch to passthrough for near-native performance with
minimal userspace overhead.

>
> Is the target fuse filesystem expected to be used by arbitrary users/apps
> or by a controlled set of users/apps where a posix_fadvise() may make
> sense to configure readdir vs. readdirplus?

I think it'll mostly be used by different containerized/batch
workloads and services, so for Meta's use case, I don't think it can
assume users/apps can be modified to use posix_fadvise().

>
> What is the minimal set of passthrough ops that would make this useful
> to your internal customers? Is readdirplus in this set?

The minimal set of useful passthrough ops would be open + read
passthrough, getattr/statx passthrough, and readdirplus. The internal
use case is read-only. readdirplus would be useful because the
workloads often do directory walking followed by metadata lookups for
the entries

>
> Do you have profiling numbers to indicate which ops generate the most
> overhead for would-be passthrough ops routed to the server for the
> target workloads?
> And how do these numbers improve when using io_uring channel?

I do not, but if you recommend getting them, I can run some benchmarks.

>
> Regarding "full subtree passthrough", what does that mean?
> That lookup op itself is passthrough?

Yes I was thinking this would be something where once a directory is
marked as full passthrough, the fuse server never sees any requests
for paths within that subtree and everything is fully passed through
to the backing directory.

>
> In that case, would there be no way to escape (opt-out of) passthrough
> inside the subtree?

Yes I was thinking this would only be used when all files in a
directory map 1:1 to a backing filesystem.

>
> The semantics sound challenging especially when considering
> moves of directories in and out of subtrees.

I was thinking cross-boundary moves would just return -EXDEV, but
there are probably other semantics I am glossing over here.

>
> Anyway, no wrong answers here, just trying to understand the
> first mile store you are aiming at and the expected improvement.

The first goal I have in mind is eliminating the getattr and open
round trips. I was envisioning the passthrough work to be a
multi-series effort where
everything would get merged together at once only when all the pieces
were ready.

Thanks,
Joanne

>
> Thanks,
> Amir.
