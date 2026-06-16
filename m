Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C82743C065
	for <fuse-devel@lists.linux.dev>; Tue, 16 Jun 2026 11:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781610627; cv=pass; b=aAMJ6ve+7bsLoFDWus/Sc7H2605C07Xv+Kb65CiytPQJb8NAaMLgDQV4bvVxCvsqj0vxDDB1nL+LlW0F+9C1BXfkC1VZ6EY2PAyoUIleqFRuUfJq13DmPzoyvqIaYDmdSCTkbAbRYRnniJgKUyX6oZ6Ys7WruaWwz1Jntjk0vBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781610627; c=relaxed/simple;
	bh=QKG4i+4ZHEfwGJFf6TT9YM//DhFhI78L2GggokTL2Fk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y5LQs+eEMm8a4vxCxLW+gnT2txANlMZK0GXlcDN2GRRJhg5IHmSaFh+sLa2uOxKvF6lWIU1b1L2JqN2QHZTcsM/3WNeHJYnF5TsH5awtdpYFXq6zsK2jXXRZsboUPbtoMJazqszY6D8i4ZSPh5A+Nxqjcyb6vush6pnFBLg0kNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QNBgBete; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QNBgBete"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-69165354c87so5666427a12.3
        for <fuse-devel@lists.linux.dev>; Tue, 16 Jun 2026 04:50:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781610624; cv=none;
        d=google.com; s=arc-20240605;
        b=TM92Vbez4QNw176JVpc/d9rVcL+HbfSuK7RMRHIyHoLEwn26DAbjEScbpFGIlh+6Oc
         WppSMCJsy76/jCSSKI4Y17+C0AmFHT+58dvrmq3z+6S19b0cQMJFp2xfJjHIsccmUFqx
         znF8U5u43/hNUeYTAevylkvJkDlgaFtkb40BCDZJl6+lFrNkRzgSrMr+CmJCQvG0dURc
         ySfR/gk0CeyJvOtgEmyKrQVQNaCKM+uKkMLX46JWeQXncyPJDfJBHa29cr7ga6KuMhsg
         k/WQSMKG7A/Te14ZqkRwSm0GXxuQnl9fQkmMqm1jeUl6K2jTfNJC5gSt5DshjV8tfZ3C
         sZVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RpPwsbenHMVASJp6YboD7PaeEbUb4DMpuUJdrbKpUZ4=;
        fh=Utqrihk1/KiaU3V3mFbTtjdTvbX1vuk3Wag39N6Isz0=;
        b=a3L/bpevzJgCqGpjJWSbcoEbiQaayiNHP4xA0SsVmsymQ26zdZ8WWNf7OuLGCdzAU0
         QrD49o9G94kAPL9dps9/BTuHjWBbS7bsIuKpfExEV8wjIBLTyJaFDBYR9lgW2T/AnfAh
         DNVhBAeBRVubgws5avRpJ5X61tn/9LRNId1jYZpb/we3hFgiV3BB7Evwt32KdRRkDQ5z
         QYmcGAN4pA7BgX5clWAs5AF9fUsH4HZtGjIqIT/7GPBizjDkI3P3139EGtsVKEUBQNp/
         e9ZHvgo6xx/LJ2CFIacpBVJtrIAo6qFQufTJrKkn256Kbvj+a+jjTMUPjBmgbjDRuqs/
         nS5A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781610624; x=1782215424; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RpPwsbenHMVASJp6YboD7PaeEbUb4DMpuUJdrbKpUZ4=;
        b=QNBgBeteAx5DM9K6ey+t9Tee7CGtV/qhll9HltJXvxmey1b9IJQOsvjJ6j/d/5TCCq
         RQRBA6W9f4BgxeOhq0QIi8uL4xosHUeuxSN97aEW/vGoDSp/Qd26NdX/yaiEqILOXniH
         d+ZNQgXmTHpmJig69JjM2POwiv2APqwxoDF9NbPNi6bcmA+R9IUN9CdXQwbiOrIvzRZC
         H0FIPx1lafQzGXJdT5gcDxoOd9j2EvxBZzO8QUvGXTSf7OASlylpg0z/0FS5HGD6ycHP
         ZRx/y0oCGoC6++llLIBvSf35Sq2cO5XmdjfCoKqTm2bm7P2LLgPwhVFYihSDKaCHn+x3
         nQ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781610624; x=1782215424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RpPwsbenHMVASJp6YboD7PaeEbUb4DMpuUJdrbKpUZ4=;
        b=cWlb0ocKfjX4QO5awHaigikjHzvCFahCXAqvgLTBSXhNoLU/rIXrfTK6CMT3tKWyyO
         fr5G5a3Nwvsa1vHKc8woILo2j1XqcLWq+JbaGakKChGIga6LLcVdaSt39UkMH7NN6Q7h
         iD50VVNgIoMHWpDaTipf7SMZ0Exu0lt5+Q2kMZEh0KVt2pryj8AO7ocpE550LujA4j8h
         AkPy+nJw5G5zoSi6fjn54cYev3HHa9vxBRxowKzXqIJpQUVU0FQRRsnUGv4zUz8AAuDD
         nRZYQ/R2KNQwbkuXtQxwDvTUo1f7jH7G5X1S19ofZH3gH3KaI14ZV699HE5Wmkm2DjUp
         J6mg==
X-Forwarded-Encrypted: i=1; AFNElJ/ZOZ2MSovrlgc1bF9cP/dsaZmkqXTeuPWSuOcT4WAWoSJfemeEyk8dqDEjbY2U75z1bDZKPOaVud7p@lists.linux.dev
X-Gm-Message-State: AOJu0YwTpkQAikIXVmE+zVoGlSWPiYN7/u5dqBxgjqf8mAR2nZdAYLvQ
	tsgB4jOUYYh1DPlB7m7c+gmzX8BiWuDg8iDSN+j4UGOHAMeOStVF8CWaQRLrNR0mZxhEi26Cfm0
	Jwscn4r0DY7SpUx8ElDV2S5Yn1V61xKQ=
X-Gm-Gg: Acq92OGZ3lyEhPgsQZdQXuiq0IiGGNIbVo+WD/r6agM4LllV0RBipJ4FvJ8/Z8LWR7N
	Wx5+uP3ecCzdbIZyjGN9H2hMTqjrac5VRet/UJLfpjhg3/IjhcLjiPV8BFnhZ+EWB+ZcoduvPjC
	FYpwgM17+XuCwx2JCGkbfo2TfjZUxYULx8C9yEbL+IpVDHVb3X0t5xk3KhFCH3DaYog57bvdbQH
	rOkmtyceNCsGtugYCe+TIy0SJ/8cDI3MK76IBfkR2LW5TTPb5EvWfZqawnAcwRyn8D8OlCf5iHU
	AtUd/KhcoPfzqnxZzr6cDaKZS47EdamQeL+iZk+HJg==
X-Received: by 2002:a05:6402:42cf:b0:691:affa:38da with SMTP id
 4fb4d7f45d1cf-6950875976fmr1864373a12.1.1781610623821; Tue, 16 Jun 2026
 04:50:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260529031918.7361-1-russ.fellows@gmail.com> <20260616014419.7913-1-russ.fellows@gmail.com>
 <20260616014419.7913-3-russ.fellows@gmail.com>
In-Reply-To: <20260616014419.7913-3-russ.fellows@gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 16 Jun 2026 13:50:12 +0200
X-Gm-Features: AVVi8CeOZ4TmIF70ww8MhNwGTFIWGJbtaB6gZTfHRBvvjyTFOqpaSXGuF8UoIeY
Message-ID: <CAOQ4uxioaHgn2gAevs4_GVN9z_XM8CuiBkOUzyP75Axi3Ecaww@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] fuse: allow parallel direct writes in passthrough write_iter
To: Russ Fellows <russ.fellows@gmail.com>
Cc: miklos@szeredi.hu, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Russ Fellows <rfellows@xlrait.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 3:44=E2=80=AFAM Russ Fellows <russ.fellows@gmail.co=
m> wrote:
>
> From: Russ Fellows <rfellows@xlrait.dev>
>
> fuse_passthrough_write_iter() currently relies on the generic fuse_dio_lo=
ck() path to decide whether writes may run under a shared inode lock. That =
couples passthrough to the regular direct-IO helpers and does not make the =
passthrough-specific safety conditions explicit.
>
> Keep the decision local to passthrough.c instead. Allow shared inode lock=
ing only when all of the following are true:
>
> - the open carries FOPEN_PARALLEL_DIRECT_WRITES
> - the write is direct I/O
> - the write is not append
> - the write does not extend past EOF
>
> Buffered writes, append writes, and EOF-extending writes remain serialize=
d under the exclusive inode lock.
>
> This preserves the parallel direct-write win for safe overwrite I/O witho=
ut exporting extra helper APIs from file.c.
>
> Signed-off-by: Russ Fellows <rfellows@xlrait.dev>
> ---
>  fs/fuse/passthrough.c | 46 +++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 44 insertions(+), 2 deletions(-)
>
> diff --git a/fs/fuse/passthrough.c b/fs/fuse/passthrough.c
> index ee822a983..c32b35a6d 100644
> --- a/fs/fuse/passthrough.c
> +++ b/fs/fuse/passthrough.c
> @@ -25,6 +25,38 @@ static void fuse_passthrough_end_write(struct kiocb *i=
ocb, ssize_t ret)
>         fuse_write_update_attr(inode, iocb->ki_pos, ret);
>  }
>
> +static bool fuse_passthrough_io_past_eof(struct kiocb *iocb,
> +                                        struct iov_iter *iter)
> +{
> +       struct inode *inode =3D file_inode(iocb->ki_filp);
> +
> +       return iocb->ki_pos + iov_iter_count(iter) > i_size_read(inode);
> +}
> +
> +static bool fuse_passthrough_write_exclusive(struct kiocb *iocb,
> +                                            struct iov_iter *iter)
> +{
> +       struct file *file =3D iocb->ki_filp;
> +       struct fuse_file *ff =3D file->private_data;
> +
> +       if (!(ff->open_flags & FOPEN_PARALLEL_DIRECT_WRITES))
> +               return true;
> +
> +       /*
> +        * Passthrough writes do not use the regular FUSE direct-IO iomod=
e path.
> +        * Allow shared locking only for direct overwrite I/O; buffered w=
rites,
> +        * append writes, and writes that may extend EOF remain serialize=
d.
> +        */
> +       if (!(iocb->ki_flags & IOCB_DIRECT))
> +               return true;
> +       if (iocb->ki_flags & IOCB_APPEND)
> +               return true;
> +       if (fuse_passthrough_io_past_eof(iocb, iter))
> +               return true;
> +
> +       return false;
> +}
> +
>  ssize_t fuse_passthrough_read_iter(struct kiocb *iocb, struct iov_iter *=
iter)
>  {
>         struct file *file =3D iocb->ki_filp;
> @@ -54,6 +86,7 @@ ssize_t fuse_passthrough_write_iter(struct kiocb *iocb,
>                                     struct iov_iter *iter)
>  {
>         struct file *file =3D iocb->ki_filp;
> +       struct inode *inode =3D file_inode(file);
>         struct fuse_file *ff =3D file->private_data;
>         struct file *backing_file =3D fuse_file_passthrough(ff);
>         size_t count =3D iov_iter_count(iter);
> @@ -70,10 +103,19 @@ ssize_t fuse_passthrough_write_iter(struct kiocb *io=
cb,
>         if (!count)
>                 return 0;
>
> -       fuse_dio_lock(iocb, iter, &exclusive);
> +       exclusive =3D fuse_passthrough_write_exclusive(iocb, iter);
> +       if (exclusive)
> +               inode_lock(inode);
> +       else
> +               inode_lock_shared(inode);
> +

This is TOCTOU racy
You are missing this important part:

                /*
                 * This check
                 * should be performed only after taking shared inode lock.
                 * Previous past eof check was without inode lock and might
                 * have raced, so check it again.
                 */
                if (fuse_io_past_eof(iocb, from) ||

Either you duplicate fuse_dio_lock() -> fuse_passthrough_lock()
or you find a way to have the two share common helper (prefered)

>         ret =3D backing_file_write_iter(backing_file, iter, iocb, iocb->k=
i_flags,
>                                      &ctx);
> -       fuse_dio_unlock(iocb, exclusive);
> +
> +       if (exclusive)
> +               inode_unlock(inode);
> +       else
> +               inode_unlock_shared(inode);

In any case it is ugly to open code this so at least a thin wrapper
or even a scoped class would be in order (e.g. fuse_passthrough_unlock)

Thanks,
Amir.
