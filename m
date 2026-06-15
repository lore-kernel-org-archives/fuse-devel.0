Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C597637DE90
	for <fuse-devel@lists.linux.dev>; Mon, 15 Jun 2026 11:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781524754; cv=pass; b=jBA6t9/+/oJPQZz++N8RnyXCnIxoTevUbcFFDiszi9qX/XuPjpPnybTtuXAkPrQ7wNzKRzvpnwxIO03v4n8E/bwxAdUezVAvjwknWi+OjyHIZJud7YdrStInQysPlMpOwxxocSlMJzpzjJe+sWdVERKsmQFNK0aTKXnhlErdHB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781524754; c=relaxed/simple;
	bh=6kA7H0GmJKWkCrYHa6cr9AHkZ8at8NloGJbBudA5hFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mmjjN8kkYfF1z5YkLE4H6LUDt9nt/44Y+3ezuxZQ9LdwnWe0N5Mx2P0nBhdTRd6HVm3ZylfwcnLiocJo8PMFngzt1rsWKVkykovrEEzTCyINyumTn1/s57y5IItl3pfJqZa0ILT0XduB+AwCf9G5EvxT2rvzagDmie2qRV8VQpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VQ6zG5D1; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VQ6zG5D1"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4905529b933so32720855e9.0
        for <fuse-devel@lists.linux.dev>; Mon, 15 Jun 2026 04:59:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781524751; cv=none;
        d=google.com; s=arc-20240605;
        b=DC6SkiJAZ7UT8zm0ayWFgcyCpMW0h2zA9LXlxb1j8kmnOMf3t2f/Q1JFC6dtj8ELVu
         t1JXb6lNRVY81OnSbRPqzhyCy8PpPLxEs/6uKO1uRtohnOARUYYz8tR19B/2cS+7SYcA
         Opvkx4PQAn42iSmFXD5x5uS2cXX4NtTQ2AjChfWeW/jIDWLTnJ1+qGnuxonOg9DB9ee8
         Xj1awdOS/bMHe3lK4XyPw+++sw6403BUKhpXh/1E2n8p88qYU8sdvb/2kS23JQFXCmuN
         SpvP02kA7yyVGicm8OMZP5PGyvjv+6OBdt80gyVq5o9Se49aUrKEz4Vz3l0AU3dgCE08
         M33Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V0CC/YVllWF2vVnqe5xwLKB0/btc+UAb6Noj2UwDPVA=;
        fh=V9TVbfgf0qJmYK1RgFTvir1ybhNb5wRLuv848+GU6jQ=;
        b=LWR8eMMjqJcrbGQU7aJOcIFxf+rm8HH3WMDgzT77xAT0wz/dEvnCMQvmHbCkm2aF1s
         iC/uKrBHhaDPI2r5dQ13L5azAvO6sCofSSiMyw8tjTl7dXp4n50s4G9tWh9TfLEQtmrD
         Txl9SNasta7iD7s0e4xKoxfZg1YX48ne/yInUGyxVxHLP4tfOYiLuzyjeP+saLBzOWK7
         gtNL6FW3BuVbRNaN0gAqcur/OhjT98R/CkhRV/27sOZwlTsNHHyMesRHQ4iyzPfPgX8S
         OGSp2b91CRGk2AtATvjSxfhFXYRLAv22emk5fVHQMmVWHAuAIG1h5m1e4DqH11PTS2ui
         W59w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781524751; x=1782129551; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0CC/YVllWF2vVnqe5xwLKB0/btc+UAb6Noj2UwDPVA=;
        b=VQ6zG5D18UC/EzoP3Ib1nXMbyNaQODg9qB89FTLouamSwXGG2dSVE+pPRzXqmHmy8q
         +S4UhumIJmMU7Jw4nvck2RcQBx1cM0qs66XYXdPH7Fz2XFJYKpWXkUu2Yez5bCS1Y8oE
         nvFQTSu49o03ODB0gDc5CnjT4LpwFZUYExMskSbaNTQaorl1WFl56dNIoVsMs8Exvh8B
         4/Bcz4sK1uy80Pni4Lfol1yq8uiGGa+fU0zoEuosy6BVGMczV9FGAFDHrPG37qrMyaBy
         TLeA5GVzLEk7LYjzmAkksRZNmveiwmq+LA+Vb9Sq0ioW2ykW1tcmzvntvMumlyND9O/L
         0fOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781524751; x=1782129551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V0CC/YVllWF2vVnqe5xwLKB0/btc+UAb6Noj2UwDPVA=;
        b=k7meXz/mk+BFjg57dE99TSthA8NTN1qfW4HuH8BWpi6knVOtQUGyCTcIMXyUb6dnqT
         qKqzENEzwXSA04qjWc9pMGQykaYxemX+KbHwM3aAi8fp4MsMA4KSU0MywrtM3avE9QQh
         J6Qm0ZzpVwPfVxMSXsGGG+IMV633SR8RfFzwhfLs74srhhSjVeDrqitP7be7rYgBM5q6
         VvWbOrIctgV8Dje0zIVBvNEFSSSBSxWzBM2Vss3vORxDDKsWWqRcx29OK31qqnFwpEr9
         LdRY+vw2Zcq+smkF/DxUQmqwlcmFb5lZjto6dUjnUWZbkLwHUoNeI5bG23X+SMlKv5bo
         ptYw==
X-Forwarded-Encrypted: i=1; AFNElJ8ResvHmJiYstEAcCXp0X9YiRINvDjmZow6x8D8iX3Qs40TmcuoIS7J/pvUhi4e8exheVIUXihl1qNa@lists.linux.dev
X-Gm-Message-State: AOJu0YwYXyrwsMAo8da1FM0IdJ8Yj2WgMkklZYUiQ7Do54j94Ldacb/p
	qsqfIG1Gzg/IZf55znVgaCZb6/d7tnolOwmJ0rvuHC+T+F8qBD4zCBRw/Dn+TLDDWrHHVxpqYSG
	10cHy5ykmeZMajusEMFOxkNHNARFlCfI=
X-Gm-Gg: Acq92OGL49YG0ePDRFZuCKCPOxMwIEKipwTULqNLxDnB40MlO0bJOVvmz3ZVEyvTTfQ
	NsdY/6wV25Oa/d/IcaPsEEiF90HbhFX//CKSnaN0m8oUykc4leENRjCds+QPYlVudLIokpK/C3a
	y/ZQ6DxPMddaYlbgGa80nkm1rCfugW8jU0EV9qw0g+OgPajykg4G4PLW86POF4xq15iUKpsro+X
	V3FRg6IOt13juqY1Oa7CdaeUWlItZhd2JfcXTgA/8I/BSMLzusLQGAhmjBKIcbjLsXIx20OSWqS
	EYF2NKKPKHJcEXt0d/pevbKBJ8bAEVbn+AyiGzCF1Hh8K7hlEMQYjF+6pu+pbZ9ecaY=
X-Received: by 2002:a05:600c:820c:b0:490:958c:46dc with SMTP id
 5b1f17b1804b1-490ec4e75d9mr178747595e9.17.1781524750852; Mon, 15 Jun 2026
 04:59:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260615-fuse-io-uring-race-fixes-v5-1-8a360f055f0b@bsbernd.com>
In-Reply-To: <20260615-fuse-io-uring-race-fixes-v5-1-8a360f055f0b@bsbernd.com>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 15 Jun 2026 07:58:57 -0400
X-Gm-Features: AVVi8CfZ5ax7OL9NyCoAEtUKUgBg2U-kf__R6az6Rc6qdLhisgnsPOns4QEKtdk
Message-ID: <CAJnrk1Y3K010AVZUhmPRV-3TN5R5EeCunG1tzbCtVriqgQY=ow@mail.gmail.com>
Subject: Re: [PATCH v5] fuse: clear ent->fuse_req in commit_fetch error path
To: bernd@bsbernd.com
Cc: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Zhenghang Xiao <kipreyyy@gmail.com>, 
	Shuvam Pandey <shuvampandey1@gmail.com>, Berkant Koc <me@berkoc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 6:26=E2=80=AFAM Bernd Schubert via B4 Relay
<devnull+bernd.bsbernd.com@kernel.org> wrote:
>
> From: Zhenghang Xiao <kipreyyy@gmail.com>
>
> fuse_uring_commit_fetch() error path called fuse_request_end(req) without
> clearing ent->fuse_req when fuse_ring_ent_set_commit() fails. The
> still-pending fuse_uring_send_in_task() task-work later dereferences the
> dangling pointer through fuse_uring_prepare_send(), causing a
> use-after-free.
>
> End the request with fuse_uring_req_end(), which handles all conditions
> already.
>
> Annotation/edition by Bernd: The UAF should be fixed by other means alrea=
dy
> and actually has to be avoided that way.
> Just checking for ent->fuse_req =3D=3D NULL in fuse_uring_send_in_task()
> would be prone to race conditions, because if malicious userspace
> would commit requests that have passed the NULL check, but are
> in doing args copy, it would still trigger a use-after-free.
> Setting ent->fuse_req =3D NULL in fuse_uring_commit_fetch() still
> makes sense, though.
>
> Reported-by: Shuvam Pandey <shuvampandey1@gmail.com>
> Reported-by: Berkant Koc <me@berkoc.com>
> Signed-off-by: Zhenghang Xiao <kipreyyy@gmail.com>
> Signed-off-by: Bernd Schubert <bernd@bsbernd.com>
> ---
> This is to fix race conditions reported by Berkant and Zhenghang.
>
> Changes in v5:
> - Rebased against Miklos' for-next branch - all except one patch already
>   picked up
> - Use fuse_uring_req_end() instead of hand coding what it does
> ---
>  fs/fuse/dev_uring.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/fs/fuse/dev_uring.c b/fs/fuse/dev_uring.c
> index ba5edf5d01b3..77c8cec43d9c 100644
> --- a/fs/fuse/dev_uring.c
> +++ b/fs/fuse/dev_uring.c
> @@ -1003,9 +1003,7 @@ static int fuse_uring_commit_fetch(struct io_uring_=
cmd *cmd, int issue_flags,
>                 pr_info_ratelimited("qid=3D%d commit_id %llu state %d",
>                                     queue->qid, commit_id, ent->state);
>                 spin_unlock(&queue->lock);
> -               req->out.h.error =3D err;
> -               clear_bit(FR_SENT, &req->flags);
> -               fuse_request_end(req);
> +               fuse_uring_req_end(ent, req, err);
>                 return err;
>         }
>
>
> ---
> base-commit: bb43b4c7ea2a8265141aa93240f3f0ca71d85c0e
> change-id: 20260518-fuse-io-uring-race-fixes-59760420d2ae
>
> Best regards,
> --
> Bernd Schubert <bernd@bsbernd.com>
>

Reviewed-by: Joanne Koong <joannelkoong@gmail.com>
