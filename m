Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE91B29B228
	for <fuse-devel@lists.linux.dev>; Mon, 13 Jul 2026 17:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783963488; cv=pass; b=lV13Jz2nYd6lLJUEAH8L1EnIzedZ8rylNO8WWcYfLLkQqJsBZxiys6iqgiiLd6dRZwI5jDYI7hS3gkOXJl/EYuFtFTy3NNZgjFKj4SkHE+roHyGWQuV10psAiZLkI5DgsdDXk6iw3JKyPkYn7UvjfqpZ/7zV4I790jgXkaOlO3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783963488; c=relaxed/simple;
	bh=U9+pV9BQK0J2LKLjG50wc3GsJtadYzCJrEoYSxQcAco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jpu/hcUXMB0IFF0ZuCO2g9i0eAeCnFLWJvRJjsRjWL2r6N2L3sbxP1uMXxi16I5YkaaCbHCuIEqu9uTQWDi+m+VD1WZrPNC+FmWvkMAo/cEgS8KKSQXa/nshbPnmUaaUuxhLQ7qBHYoglVh6aegBcvASdBDwZlJXItQw2VyyQLc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S9cNRN2d; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S9cNRN2d"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-476d8e647e9so3452372f8f.0
        for <fuse-devel@lists.linux.dev>; Mon, 13 Jul 2026 10:24:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783963485; cv=none;
        d=google.com; s=arc-20260327;
        b=rEeZfa9dVXZ5nsyQXzxD/xU3FeywjV02hS3cxeEAV+iO6MNc7kKwiKRHUFciTrexZc
         uGb4MTI9yBuYAfBcqqziZeHKDlCxFt3Yyb7RDlGU4Rt4aDxED0XTFCrj4wW9hJPL69rO
         TW8JtR93On9BxBzuJu100RMZEUMqAYHWgCyRtkpMvTqiUfMcHaVjXfSBVd+CPsUo6WNP
         CNvN73juCOmdgAQL6qkVJhSqG6XaxRmfb0YWTjoliR5ZWOeRWpPtpEaatSe8GykOozik
         wnQiCxaO9GA43O3y83KHs7/oWnJ/1dh+5x+X09ubkehpbr3LJOII0is4fkjlNFSIrTRu
         sSXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LsYopPB6o48hPqvaNGGMWtc62srs6hllgE/2L+4vLdY=;
        fh=Z8MykYfWFs7GBuDJtGuwyx6iVNRP+qzDGMw1FZNbVzc=;
        b=CaR6bxcLpHF0MMznnZTDt3mPJ3i5cgwv2wf74hnvR5B/Ob6yClqM8rmVAzpAVMbbNX
         SO8gHk6/AhuqPZri+w6oVL1qJ1q9ncpG5/KiKMGc6VvZqdJ4RlVMvMTWAd17PHRIPTn7
         RCRyAHktmgTlfokVdNxHyoK52ha4sivPQ9pyUQ+UikHNiiIwoEB4FWFmhEtP3tdpiCi8
         n78PWqsg8l3ohI91hbskLOVAGYDviQHfXqVlGmS3o0klMduwl7OalYCN1fOQMFPNRB+J
         dw7hplyxb8av5hk7zoLnIiFAE514HGImz3GJ0CZhHIcJ2/+pOpqONHosxUhnIDTmgw83
         Iv+Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783963485; x=1784568285; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LsYopPB6o48hPqvaNGGMWtc62srs6hllgE/2L+4vLdY=;
        b=S9cNRN2dmvh8ns9t0fG/jmTg4krdvYPf6WKwj4oVO5j5gjx3H+JTvzFF3RMYq2vWfC
         ocQMxU5IFuexoGNYJGpCPTmhpDacZAd3iTwYX/l9ESBb9dR0fXJ4KE4rtLNrcpVCc0YC
         5D+r0K10IbYHud6dGhlo2fZxn2DZ0PqA/w4cDDiZ7lFevEHA/8BFl69+ZliT/iOkpocE
         DtQFQLOFEK01Nti6i8hcIekUzpSsQuQAptxg447WRJKcFDBKoaNe+ncoiyjtx3Y5tusu
         GNHeIEfe9HbQOkrb8vJJMoF3lf2kUw/aiCKhAjEy1LUSO+xyFvc03etynAzrx8bZZ6fz
         igFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783963485; x=1784568285;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LsYopPB6o48hPqvaNGGMWtc62srs6hllgE/2L+4vLdY=;
        b=fqIpPk8TBOsGhdji6AJNP8z7HUeUTOFyacWfyiVCt6s2YWHU7uddis1je2XUDXfQ/o
         lV+Yn3BWhaks03AKazVBwONIEhjwm5emlQu3PYkbz8V/Dw2OyJoBlVNV3RsNCn7nG7lV
         uTkkN5+FGOuBvNZ9fTlQ/WlHlWgHihKYeNgyNw4cADTLm1ipLnd71soDDeXKFZxC7CMO
         Qw4kdKJywCaep4T46tBFZbLCFA3b36z1FNshfuMqrDugRTDACgKeG3Uiac3SIhQOWRZm
         tgkhxOxLXwho5pILS4a+gogYRMKeqKS++V4K2ydYtvohyX6eUkFaXpAhAQLMx/ZAJ1tS
         Xg0Q==
X-Forwarded-Encrypted: i=1; AHgh+RoPlIlNlR2f5gzr8h4lbFAd68Os1zRR071MfUcrpIwQomifrh/52KxBoLe2f6u56+Dzx6qsDD3Gn/aZ@lists.linux.dev
X-Gm-Message-State: AOJu0YwiwG7Egndu/UT98JudLOXK19vbpnGawYpzREgZLbIaLCNwlc2K
	NDFOKRXqs4Z1ntSncHAKvDN+36AjnHUgzMZaMm25xy5OYNiVwzmLR93Ts37cupfMbp+qEYpO+/n
	MkvRMLF8R33LvbsBW3/tO8Nog1tpleEY=
X-Gm-Gg: AfdE7cn04aHykO+yygekkXOvhiLd1nnG9mc0IkKoBrMMMRsarRm4HIs5ZgF5zeGJiLL
	l3Okagt858f7skT9KVgyK3Wq/Zgh6FqiQWX2v34xAuG8K+r4DQ93wb9hDcJL/7mo1++Wi5+6HjS
	UIh+duKoVar86hsCENWIe7dLR/Hgcw4uONL1jD7uzn/8KB1xbdViYNCzpTq3brqa2S2tETpVq6e
	2fTA1o9oZxOyC2LXHaN22s5S60HFcaqIMwRd+EuVrxYhMxEvhFxmmsH+tUqO2qpnQPJlIM7flP9
	zl2Vewc5B1LVhFZwKQTTZr0yUOEQkS5oY8QW+JaeTgZqCTHh3MDuOLhpwAnG67mvtogAdw==
X-Received: by 2002:a5d:5f89:0:b0:472:326c:a4a1 with SMTP id
 ffacd0b85a97d-47f2dc9b856mr11273284f8f.22.1783963485101; Mon, 13 Jul 2026
 10:24:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260709211130.543773-1-xmei5@asu.edu> <20260709211130.543773-2-xmei5@asu.edu>
In-Reply-To: <20260709211130.543773-2-xmei5@asu.edu>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 13 Jul 2026 10:24:33 -0700
X-Gm-Features: AUfX_myhSaDPwHMJYmu_3zqBXlJBVmiSvx7jGX39NT-6i7iZPVT7Znv4C7dKQp4
Message-ID: <CAJnrk1Zek9hHOehCjfmR42+Gc=K6vixmyn5977ZHv3J5fUUS_A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] fuse: bound io-uring payload copies to the
 registered buffer size
To: Xiang Mei <xmei5@asu.edu>
Cc: Bernd Schubert <bernd@bsbernd.com>, Miklos Szeredi <miklos@szeredi.hu>, Kees Cook <kees@kernel.org>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, fuse-devel@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Luis Henriques <luis@igalia.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, bestswngs@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 2:11=E2=80=AFPM Xiang Mei <xmei5@asu.edu> wrote:
>
> The fuse-io-uring transport imports each ring entry's payload buffer at
> ring->max_payload_sz and bounds both copy directions against that value,
> ignoring the buffer length the server actually registered.  Both the
> server-supplied reply payload_sz (fuse_uring_copy_from_ring) and an
> oversized request payload such as a large FUSE_SETXATTR value
> (fuse_uring_args_to_ring) can then overrun the imported iterator and hit
> fuse_copy_fill()'s BUG_ON(!err):
>
>   kernel BUG at fs/fuse/dev.c:1053!
>   Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
>   RIP: 0010:fuse_copy_fill (fs/fuse/dev.c:1022)
>   Call Trace:
>    fuse_copy_args (fs/fuse/dev.c:1329 fs/fuse/dev.c:1351)
>    fuse_uring_copy_from_ring (fs/fuse/dev_uring.c:686)
>    fuse_uring_cmd (fs/fuse/dev_uring.c:1226)
>    io_uring_cmd (io_uring/uring_cmd.c:271)
>    __io_issue_sqe (io_uring/io_uring.c:1395)
>    io_issue_sqe (io_uring/io_uring.c:1418)
>    io_submit_sqes (io_uring/io_uring.c:1649 io_uring/io_uring.c:1934 io_u=
ring/io_uring.c:2057)
>    __do_sys_io_uring_enter (io_uring/io_uring.c:2646)
>    do_syscall_64 (arch/x86/entry/syscall_64.c:63 arch/x86/entry/syscall_6=
4.c:94)
>    entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
>
> The request path overruns the same way, via fuse_copy_args() ->
> fuse_uring_args_to_ring().
>
> Store the registered payload length (payload->iov_len) in the ring entry
> and use it for the import and both bounds checks, so the buffer the
> server provided is honoured and an oversized reply/request is rejected
> (-EINVAL for a reply, and -E2BIG/-EIO for a request, matching
> fuse_dev_do_read()) instead of panicking.
>
> Fixes: c090c8abae4b ("fuse: Add io-uring sqe commit and fetch support")
> Cc: stable@vger.kernel.org
> Reported-by: Weiming Shi <bestswngs@gmail.com>
> Assisted-by: Claude:claude-opus-4-8
> Signed-off-by: Xiang Mei <xmei5@asu.edu>
> ---
> v3: propose the patch fixing another issue found by Bernd by Joanne sugge=
sted way
>
>  fs/fuse/dev_uring.c   | 9 ++++++++-
>  fs/fuse/dev_uring_i.h | 1 +
>  2 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> index 0814681eb04b..248e5a3e340e 100644
> --- a/fs/fuse/dev_uring.c
> +++ b/fs/fuse/dev_uring.c
> @@ -650,7 +650,7 @@ static int setup_fuse_copy_state(struct fuse_copy_sta=
te *cs,
>  {
>         int err;
>
> -       err =3D import_ubuf(dir, ent->payload, ring->max_payload_sz, iter=
);
> +       err =3D import_ubuf(dir, ent->payload, ent->payload_sz, iter);
>         if (err) {
>                 pr_info_ratelimited("fuse: Import of user buffer failed\n=
");
>                 return err;
> @@ -679,6 +679,9 @@ static int fuse_uring_copy_from_ring(struct fuse_ring=
 *ring,
>         if (err)
>                 return err;
>
> +       if (ring_in_out.payload_sz > ent->payload_sz)
> +               return -EINVAL;
> +
>         err =3D setup_fuse_copy_state(&cs, ring, req, ent, ITER_SOURCE, &=
iter);
>         if (err)
>                 return err;
> @@ -725,6 +728,9 @@ static int fuse_uring_args_to_ring(struct fuse_ring *=
ring, struct fuse_req *req,
>                 num_args--;
>         }
>
> +       if (fuse_len_args(num_args, (struct fuse_arg *)in_args) > ent->pa=
yload_sz)
> +               return args->opcode =3D=3D FUSE_SETXATTR ? -E2BIG : -EIO;

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>

Not saying you have to do this, but if you wanted to, I think it'd be
nice to have a separate cleanup patch that deduplicates this setxattr
special casing logic between the /dev/fuse path and here.

Thanks,
Joanne
