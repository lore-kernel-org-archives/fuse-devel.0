Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A59F3B1ED0
	for <fuse-devel@lists.linux.dev>; Wed,  9 Sep 2026 19:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788981606; cv=pass; b=AmuMBrqh7IGv8rahqrb9s57Dcux6zPfPjdcOBQ7KVTmGFDgi3AFYiJ6c0N6RGVq7DYny55gcjTCASn58lpoCKKNZdw4mApAAdbYP/R4OkQCYh+Mtm6vj61Qy08MMnzH9DfctN+rmxS3ojkFKiGOs2dGjoSBNPjiqWHkmD0r9UpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788981606; c=relaxed/simple;
	bh=Ajiydw3L25W781rT08oBIgJWAfLm/lQwQ3vUJDLb5Dg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YRvDmWXwDThJcSS6cZ1ktO8kQxl+Yggvi5sMbbtQUW8kq1Lr+qr5zodwkGRRuJMA/qNWQQoW2nR7Qco87vqjp/OwDDFazJNjFtwvxsXkknT2Mf2mW8EOKMOspJ1DeUsgwWCOli6ttRYVdSzKS0AS5ADssBLvG4yKimsFitpXFpA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RuNU7XDd; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RuNU7XDd"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4843f205a5bso4186836f8f.1
        for <fuse-devel@lists.linux.dev>; Wed, 09 Sep 2026 12:20:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788981601; cv=none;
        d=google.com; s=arc-20260327;
        b=jjfzbuU3Eb77PqGVCa0gLUe1HCMDPkYLoPORJN38UAt9nk6j8AP2sxEit42DJ/+zP1
         RgsAe10kdJ2qz+uvq9+tEK8bBTXN2lzOPQe44/kWeweMF3gyoYEXZVR0Lwx1RxAWFU3w
         WJPFVwLTgp0BwCW87JKhOz75ywhFQDSxfzXlSqITJQMvqHjFq9hTjuA0Iz4pZRU5J0G3
         soO3OyF3ym2O2rpgJHTyY6DPMcEJdOqdvMX4uR674TSiI+1d2iL/qdAhlj1wJmXg3ems
         W4azkDPOQFRNa2pweyFPutwBzqFT3tuBpwupJcgkln1lTVL7Q0yWdjwYN1E6UBg2LBjP
         izzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5FRm+Wk/CzcgkkZNM6le/ovLDE/1ge45ZLQJ5VGLwHc=;
        fh=zKz3KqQL+Qfhh2jSabhfG9NVW7QDIKDfJQEtSFrzx2I=;
        b=K6rLrTdKKCW9znJanGp92bJ3jzcTHi9OpsFWohHyhWzdQeaDyW+j9UJnNF+hd1mmld
         sAobzhT40owWaJ3EHrew1S9GBsPKJC1ppKV0gFG1DbMuzb/nYiixw7yxzGN7ug+B9HxM
         t/it1J1pVHIGhvjqP0LYZaz/inSQWNEoIidXPWe6ptM9Ad84gxRabI5ieyT3ICgTxzDm
         XA+xDL4rjmX7Sa8GQdkSXokPYZZVoIU9jMZfxQ3oEXELUxbf8eurRR5w2GF/yPx65uxv
         KW1IFGrCOAkaT+ExAmUloY6W4M93tlTuhDOGCM1tAnSnoOH0Z4QchwD6tNqdpxeE3SDm
         +CEg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788981601; x=1789586401; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5FRm+Wk/CzcgkkZNM6le/ovLDE/1ge45ZLQJ5VGLwHc=;
        b=RuNU7XDdtZEd+o762+Gn+R/7KLPgM18lNGyfqEbnaAsNoUKUlmImAAhIqcH9mxgQXd
         MTmrmDQjMzMvH9rEdxL0zQH312tLCiIgcRfcBUie+k17RAN8Rd+kL2eebLYjq1XRZsl0
         CyglDHun1mngC8p9jamWCrobHzcIOlJip58bekJ0sfmbsbK/9wwmXopD4oCGonDkDz7A
         8dMqHgfx1E+uxVx2Z1Ai8mqbiY8Ehns0gmqaOwz8BtPwjxO0jaMzhCaSbB2kwhEKpLts
         6JploVFqFHiN3JY7w8rWmE8rovl5Yw66XQumlSJyEcso1RmT0QlTf7pdcYtsUf33Mhyi
         QQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788981601; x=1789586401;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5FRm+Wk/CzcgkkZNM6le/ovLDE/1ge45ZLQJ5VGLwHc=;
        b=ku3dF0QqEPQRKayzFDd1CUKCgWjuJwj3HrV6HmCn0JJQYxQXhVlyATEDrmzS+LXGnW
         Rk7W4QwlzXtaZeKH+nfaP7C0nzV7x1JykQuRxPTyxJDEkBFfQnpLGgKe/jE5ruS/vfkw
         ivYjJdVQ3iU6ltDRU1rgrSJibzROcY854J30uyZ1eow7lP2cwJtUFYk6lrkvjwGH/whd
         C2/o+vWzqVl/3/Cm1dh6B7LffbQeqGwt3obbpx86eU1DhGR8IE3GAz7ocFl+ktjFh9WS
         PJq4uIs4s5Z8QuTRorE8g8Mp+UySPboSySSknMWaHq+FQZl1fziLGJ7qrIIHVILNHHi8
         ZSsw==
X-Forwarded-Encrypted: i=1; AKwUvByW5m6N49KWE3/Qbc/n8btWqJqX77PAALMkcGaB3lLP5CGJZcYEMUUFHD/mAtBbJCio8xPbcn4qEMGH@lists.linux.dev
X-Gm-Message-State: AFuF++nVJr6l2AQHUoy9tVcsW+xjNB6SGR174RlIu5WvRGBEQb6/p+an
	+X0n9UIcvwt/2WwKLW60/eGT46s3T/Mq6r4mtYUIOiilluZQdpCtiRKWe15YbbBF/HMH2nRclQp
	uFMknB9P8ivNlT78uEpfpRQHcZu0gLpo=
X-Gm-Gg: AYBFou3bgXjPxFAnoN9bVm0SLOX1wyBOmvGDfb8cEe14lFls7VRwuyipS53d7Y+w7iK
	vis9phOJDANqCxNyUlXSA26576aCoCAcj9EtX88wfxdhmVlUI5Dg4s+i7FQLZufLqndgVTKqSOy
	bSVzATSUO04aMxywS1cEPKEAWmKTAPmoHAcv+9sbrBlhQjrGcMSJM/JZs/RIDboyqhcoBdjAa5x
	pflchJY/lXuL0JSTbRYkhX4aIRtPhUM7fOrkDWgAcv7m1gJwkIbC84zgIBv1s6tdwfLvaaInB2z
	ewSSabGW1POY4YTtSz3gWuuBmXJGJinsOEpv48CLB4/r3gm0JrzsQuK2j0xVsKSpM7pN4ANhk9C
	mQDX2j0Sz7a/QUvWqZA2z7ry6eeaMQCnRFAQhXpXLfoU3jbrM
X-Received: by 2002:a5d:588b:0:b0:485:ac96:7263 with SMTP id
 ffacd0b85a97d-485ac9673b3mr6592105f8f.12.1788981600320; Wed, 09 Sep 2026
 12:20:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260906012924.1928316-1-xmei5@asu.edu>
In-Reply-To: <20260906012924.1928316-1-xmei5@asu.edu>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Wed, 9 Sep 2026 12:19:47 -0700
X-Gm-Features: AcwNN1UbD6k4LeCepkUvjqBr96R-weQxM4XVCQGN4UqRnGUCJVeyGH44lDLJG20
Message-ID: <CAJnrk1aXL9QuW+USSbx2La9qgNYU8jybqqpoSSRo6wEAAZqxAw@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] fuse: bound io-uring payload copies to the
 registered buffer size
To: Xiang Mei <xmei5@asu.edu>
Cc: Bernd Schubert <bernd@bsbernd.com>, Baokun Li <libaokun@linux.alibaba.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Kees Cook <kees@kernel.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, fuse-devel@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Luis Henriques <luis@igalia.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, bestswngs@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2026 at 6:29=E2=80=AFPM Xiang Mei <xmei5@asu.edu> wrote:
>
> The fuse-io-uring copy paths do not check that the data they copy fits
> in the ring entry's payload buffer.  fuse_uring_copy_from_ring() passes
> the server-supplied payload_sz straight to fuse_copy_out_args(), and
> fuse_uring_args_to_ring() copies the request in-args without comparing
> them against the buffer.  Either can exhaust the imported iterator and
> hit fuse_copy_fill()'s BUG_ON(!err).
>
> An unprivileged user can trigger the request side by mounting a FUSE
> filesystem that registers small payload buffers and then issuing a
> setxattr() whose value exceeds them:
>
>   kernel BUG at fs/fuse/dev.c:1064!
>   Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
>   CPU: 1 UID: 0 PID: 148 Comm: exploit Not tainted 7.3.0-rc1 #2
>   RIP: 0010:fuse_copy_fill (fs/fuse/dev.c:1033)
>   Call Trace:
>    <TASK>
>    fuse_copy_args (fs/fuse/dev.c:1354 fs/fuse/dev.c:1380)
>    fuse_uring_args_to_ring (fs/fuse/dev_uring.c:891)
>    fuse_uring_prepare_send (fs/fuse/dev_uring.c:940 fs/fuse/dev_uring.c:1=
057)
>    fuse_uring_send_in_task (fs/fuse/dev_uring.c:1745)
>    tctx_task_work_run (io_uring/tw.c:96)
>    tctx_task_work (io_uring/tw.c:133)
>    task_work_run (kernel/task_work.c:233)
>    io_run_task_work (io_uring/tw.h:84)
>    io_cqring_wait (io_uring/wait.c:278)
>    __do_sys_io_uring_enter (io_uring/io_uring.c:2676)
>    do_syscall_64 (arch/x86/entry/syscall_64.c:61)
>    entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
>    </TASK>
>
> Bound both directions against ent->payload.iov_len, the length the
> server registered, so an oversized reply is rejected with -EINVAL and an
> oversized request with -E2BIG/-EIO, matching fuse_dev_do_read().
>
> On a zero-copied request the last page-backed argument is handed to the
> server as registered pages rather than copied into the payload buffer,
> so exclude it from the request-side sum to avoid rejecting valid
> zero-copy reads and writes.
>
> Fixes: c090c8abae4b ("fuse: Add io-uring sqe commit and fetch support")
> Cc: stable@vger.kernel.org
> Reported-by: Weiming Shi <bestswngs@gmail.com>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Xiang Mei <xmei5@asu.edu>
> ---
> v2: add: Cc stable and Reviewed-by tags
> v3: propose the patch fixing another issue found by Bernd by Joanne sugge=
sted way
> v4: no context change as v3; add Reviewed-by: Joanne Koong ...
> v5: no change
> v6: rebase on fuse.git#for-next.  The ring entry already keeps the payloa=
d
>     iovec and imports it at iov_len, so only the two bounds checks are le=
ft.
>     Skip the page-backed arg on a zero-copied request, it does not consum=
e
>     the payload buffer.
>
>  fs/fuse/dev_uring.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> index c6dd420c4034..981b7c295e5e 100644
> --- a/fs/fuse/dev_uring.c
> +++ b/fs/fuse/dev_uring.c
> @@ -775,6 +775,9 @@ static int fuse_uring_copy_from_ring(struct fuse_req =
*req,
>         if (err)
>                 return err;
>
> +       if (ring_in_out.payload_sz > ent->payload.iov_len)
> +               return -EINVAL;
> +

This logic will break fuse zero-copy reads (ent->payload.iov_len is zero).

imo I think the cleanest fix for this bug in general would be to just
remove the BUG_ON in fuse_copy_fill() and return back the error, eg

--- a/fs/fuse/dev.c
+++ b/fs/fuse/dev.c
@@ static int fuse_copy_fill(struct fuse_copy_state *cs)
              err =3D iov_iter_get_pages2(cs->iter, &page, PAGE_SIZE, 1, &o=
ff);
              if (err < 0)
                      return err;
-             BUG_ON(!err);
+             if (!err)
+                     return -EIO;
              cs->len =3D err;

This would cover both the request and reply side and get rid of the
special logic here and below. It'd also make backporting to stable a
lot easier. I think it would still be worth having the FUSE_SETXATTR
errno fix (eg returning -E2BIG instead of -EIO)

    if (fuse_len_args(num_args, (struct fuse_arg *)in_args) >
          ent->payload.iov_len)
              return args->opcode =3D=3D FUSE_SETXATTR ? -E2BIG : -EIO;

as its own patch, where that check is only about picking the right
errno, not about preventing the BUG.

WDYT?

Thanks,
Joanne

>         err =3D setup_fuse_copy_state(&cs, req, ent, ITER_SOURCE, &iter,
>                                     issue_flags);
>         if (err)
> @@ -854,6 +857,7 @@ static int fuse_uring_args_to_ring(struct fuse_req *r=
eq,
>         int num_args =3D args->in_numargs;
>         int err;
>         struct iov_iter iter;
> +       size_t copy_size;
>         struct fuse_uring_ent_in_out ent_in_out =3D {
>                 .flags =3D 0,
>                 .commit_id =3D req->in.h.unique,
> @@ -887,6 +891,16 @@ static int fuse_uring_args_to_ring(struct fuse_req *=
req,
>                 num_args--;
>         }
>
> +       copy_size =3D fuse_len_args(num_args, (struct fuse_arg *)in_args)=
;
> +       /* a zero-copied page arg does not consume the payload buffer */
> +       if (cs.skip_folio_copy && args->in_pages && num_args)
> +               copy_size -=3D in_args[num_args - 1].size;
> +
> +       if (copy_size > ent->payload.iov_len) {
> +               fuse_copy_finish(&cs);
> +               return args->opcode =3D=3D FUSE_SETXATTR ? -E2BIG : -EIO;
> +       }
> +
>         /* copy the payload */
>         err =3D fuse_copy_args(&cs, num_args, args->in_pages,
>                              (struct fuse_arg *)in_args, 0);
> --
> 2.43.0
>
