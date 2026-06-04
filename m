Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1552413D96
	for <fuse-devel@lists.linux.dev>; Thu,  4 Jun 2026 11:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780573152; cv=pass; b=vB5SkQZjb/Zz9rY75dPaE6aWI5SjubgU2ljR1Ett/gaAnlf6Fo48gqi75NTmWHadJadTZpQTIAoTTah5zAUDnodZBi10MUE6XIS4UyJlYN51S5l9co6tadix+dtX47B/Sfd/CSXrL2l7U4rrLjXlIxN5JlpfyuhiAbhBdhPvrIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780573152; c=relaxed/simple;
	bh=wIVCb2tFnJMJ3EitQ8kkm+1Ios57WCliE0rfj15yF8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vp+ukWNTJufflGclylkahBiVghxfBEV3RJpn5NimMbNhdZGjAFRjmdCmRNpTNkkwPOWVuQDrJqbe1zHlwMYeSF/Z4XwojHs4ZoOX+qSPe+bJ6wC++770IRgQlNCpMGsdlHq7XRdIfM/70HEew1JvCV2KHXm7hqhgk6BPAMq+5AU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=NU89JYd7; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="NU89JYd7"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-516d0db9372so4698721cf.2
        for <fuse-devel@lists.linux.dev>; Thu, 04 Jun 2026 04:39:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780573150; cv=none;
        d=google.com; s=arc-20240605;
        b=jn3egJKcdbtM2RLe+Ng58W+UyLiNj9LeOyOf8my5jddmCEzldJWyAdc51GwFhYcaLL
         Pzmoqt7RsRfyPW1J6/Sxr3yBB4768D3CNwQrBD0mn8yA59JN2pFifBK0Kp4HxYTVJne5
         6yIOaLlMiH/Eqk0sjplHMJK8tmzdqpKysxZcG4iOoLEaCSGha7iWsXUbe8kKPTTrxjMb
         B4cIYZbfcvHeD0O/K5V+RCvvpo7HElUkhyUJnhnvQkzT5Tu6XEBkorMJozsbOabFHycJ
         IYxpXKoecD/LDtFcbrTlmpgVzQXKSBoXDJiJQ4SzuqS48Q4esRiM/6/5ekJN8iQn8bU0
         gIzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0zLSTYOXdLcBAt8Q32kyk96azm/PtDRBZ0577QtB8Mc=;
        fh=iyf3PjNUmcoUx2qQznYk/DEriiflT9mywl9AldLlhx8=;
        b=Q/+4eR1oRHbgmARyyIGcbpRRZRXDm23BWMUAsKb+gr5hVFECSkA20dygsJ1z991LC8
         DGbtDJAdrYWBCXHarPrVN7N5Gw/Yq4NhRiH3sRA3yTEalgmSleTnc/S5Q/EupWmDqPKk
         DBKR5aYajX6rdxTvX8vTCLSkO/g2YMRUAcrOlJf3s6unPeFc2FGv/1PM7udmtarjAkR+
         6vVPV7YFKoDatn22Q7ZLiY6laQJmnXD6wjF3P3ZIdwO/fmUzivYhv6VIEzUhfL6P5oKn
         KkEhXv0GhYck1DGnnxqmnAqYgztgLIQOdyYCO5pHOCJ7RlECOePr9lXGh0o0DhCQxPj6
         +Pzg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1780573150; x=1781177950; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0zLSTYOXdLcBAt8Q32kyk96azm/PtDRBZ0577QtB8Mc=;
        b=NU89JYd7PqpNdav4oeKkApWVqVVL6BZIln1Os1yOIn1RVYSsJIu+akGPBNKREjTN+Q
         /ToxMlhzMR9jbKBUPsxoOcE7fMj9ykOzm6Ye08I/b0PBDQPLOky5lBE+3ae3mQzJ1UW0
         G52fZAlj4NCCRDfl1Ilg71SnS1QveC31Al45Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780573150; x=1781177950;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0zLSTYOXdLcBAt8Q32kyk96azm/PtDRBZ0577QtB8Mc=;
        b=ERKASH3i+HiJ+HOKEY9NtfBR47OdMrTTbPkuK8uEIDkInuTgzb2BJLQJi/tMDD7tm9
         ecJWLiooMms3MNMJpec9pfJdYyOWgzLvJnq4/VeEf38oWtYD6MEcU6X7pMJmFo+EBr8Y
         1jTirNjd53eyA2CGmY7PbKvf1eeDOyTKMRlNL51XOrfhu0uudLa3zOrcWIPAZNgRedJt
         EWxeB59V/e51xhCVuE3tZE2Oyf44q1Nhak4xmCgzMTyf2fS2sJ5VY5rbnidClURr+nvF
         xvhbkN/4AHqhF1dYkajzqPR9Lt6HcTTtKDHyl/am7ZIUppHKO55f+fRhAKYojlVb19d7
         Vrhg==
X-Gm-Message-State: AOJu0YwOJ8I8acWudxwmpSDTT26uLslpX7OudX8QjjJnPU+C4I7VSP8M
	rr3Re1UgRx4d/qv2uWGjp9zwRYcgjwV0ROkgobqJ0OP8DAklxtQnX5zecY/w7Y5T0TbfIRSJH24
	H6Dylh3pKQO/PDkum1OF9kMo+wiNXLMwVpVlGYXam3g==
X-Gm-Gg: Acq92OGgXyHdL9iCvbgW2lMkYxPdNnfw3ioBycd445kFP4m3Fzue5G6NQMo7ZjEtfAS
	LU2r6IcNIc2OHhjV4GKF7r7JuWBr1rHGs5lNAnMJ6bFy16k9H12FqhKyl8AYLflEeMInj0RjVpH
	wVZBkdjvcnJzfzyDc34qUxzJQ8kchWx3AorMe1SIaCRsG336VOqAiUO1X6qhmZWukq9vmEpkeZZ
	0UUy8XoRCieiSkutX/yvJIeUBTbpu+xyDvCgACgOi6QJO8n90J7KsBxx5gDajialPqEgB8z/JWN
	F0MKg166veEQFl70+8ECMVfN2efiqlHpHr9XmvIFCeTh9P9FaSfnoMURdA==
X-Received: by 2002:a05:622a:6181:b0:517:6631:101b with SMTP id
 d75a77b69052e-51778787b94mr111344291cf.55.1780573149971; Thu, 04 Jun 2026
 04:39:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6a1d5e8a.fd5edf16.2e7427.000f.GAE@google.com>
In-Reply-To: <6a1d5e8a.fd5edf16.2e7427.000f.GAE@google.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Thu, 4 Jun 2026 13:38:59 +0200
X-Gm-Features: AVHnY4KLGvpNknzBwDpkcCnrvpiWL4AIKsDR0ylrPtD1UJKuXuq4lnEgapCwKlY
Message-ID: <CAJfpegtC3Bm+_L15RXbRSgkNB_OmE4+QsHkWU6ZhxeaKZPyEdw@mail.gmail.com>
Subject: Re: [syzbot] [fuse?] general protection fault in fuse_dev_release
To: syzbot <syzbot+5bfc774fd6dffbbc4b70@syzkaller.appspotmail.com>
Cc: fuse-devel@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 1 Jun 2026 at 12:27, syzbot
<syzbot+5bfc774fd6dffbbc4b70@syzkaller.appspotmail.com> wrote:

> RIP: 0010:list_empty include/linux/list.h:404 [inline]
> RIP: 0010:list_splice_init include/linux/list.h:602 [inline]
> RIP: 0010:fuse_dev_release+0x19c/0x670 fs/fuse/dev.c:2221

Found a race between fuse_dev_install_with_pq() and
fuse_dev_release().  One uses fch->lock the other fpq->lock, so there
can be a short window where fud->pq.processing is NULL after fud->chan
was set.  This would explain the Oops.

Fixed in #for-next, let's see if this still reproduces.

Thanks,
Miklos
