Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549A73921CE
	for <fuse-devel@lists.linux.dev>; Wed, 10 Jun 2026 08:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781078454; cv=pass; b=Sdq9Rtg0sS+NHpX5pv/Mc5kSxtIDODM6RNFncIxRo9oqXARLWuxCNiKtZE2iuYhohgJYY0XADPR+Q//cNT11bRtR7z7bB5Bsu2N9bvXIylQmXIee0Y7f1OecuM206veg200N2eems2+ZiJI902ld+MPMixhHz3SBSoMQtEB248w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781078454; c=relaxed/simple;
	bh=HACZk7sXhHpDxgFNoi5QEXIEgLajwvmDfdBj2MX4vNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tMS81deXSsHFj+/FUrb9aI/Osai7UwTA8Abai6bfvQ1mSsAbbbOP27z4pPZWqNRcXMNfBUOQD+QNldjLpq+xo1xAJVieDUXZooFXov1b70fFwSK84OsJdbyWhhD7aRRRYrABuyQSxXnlNs5TlesNUZBxdQlt3DjSAdEVrT4iaEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=IZAFx7OD; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="IZAFx7OD"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-517907feed0so55446711cf.1
        for <fuse-devel@lists.linux.dev>; Wed, 10 Jun 2026 01:00:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781078451; cv=none;
        d=google.com; s=arc-20240605;
        b=LsLYJnSB4hWEfWOTTgGPellM9Qi88+CWxO3IZLDqIbt7M9SnvOeAFrpuirJqO0ItW5
         ElfZPNTY75mFdhEE+ACaWs/02Qt7eaPNMMWDTByZXa8oCNzWGRbLb8VMnRtar85zvk8S
         WQn68AbzL/6KsyDg8+6lXbXLil9shvfMFKDq/+FIgfdCvADRqVrtQIB93VxhbhMdeUXC
         A89RFxcGD0GcpmEzYMuIhbONh6sxv662AO8IhMQ9ij4O9aX6/WsK4Cu1O68UpXZFboar
         e0uRbsvLWr0fgWMrX+5qV4+5g0J9/O9tOaN9P01LJW9L2pEhab0zAonaG3okaLup3JQA
         Tozw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HACZk7sXhHpDxgFNoi5QEXIEgLajwvmDfdBj2MX4vNk=;
        fh=KmazEasN3+gmbp0+140e8KgzLNMNaoAy754vs7/rOxI=;
        b=VuAvk52FE9FMpZcuIWlufeX58oMVR0pcAKs2WK5ut+fP3TjKFSvejMIIqEKzF/WToj
         dNfN5JPD5061WvJbrjOniuyPpFhjcJ8oR73nqQLC0T/AnJSEwmGOFdceRvNqhEbFnYjj
         I1zeNuV3f5uhtz1u7nxNQOfCN+re/3S5SsyI8Mw07D2Jl0Az1+sTXbtmfo8XRhHie5uD
         e2L+p7WPSsWNR806pE8NRzFjz7eGgwv2si4SbmZaYv2cs94XH4OR8bfsJcViln6Il1wm
         iR6OcLjXMgPSyREHR0p+ljNtPhibw6S2wgu+ujZ6+UvmC9FWTzCJToITPuAnaWQ+UQAK
         VzWw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1781078451; x=1781683251; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HACZk7sXhHpDxgFNoi5QEXIEgLajwvmDfdBj2MX4vNk=;
        b=IZAFx7OD5EpN5DvPJpfqrf1w9+NW1UDZuFxnaQKW9/XibCVOFusJXLQyDxpbpn6pav
         apeMUefMuGt7sBYMQLo61uXNwwDcXCjn3vKqJbUyEUvl+S8eCt4QaKhwsBJh8zE99+mn
         9hSPUUC22K5PF+MR8/07ogQ/fIdkL7jhHhQOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781078451; x=1781683251;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HACZk7sXhHpDxgFNoi5QEXIEgLajwvmDfdBj2MX4vNk=;
        b=naNc1wkX3jGgIbj+YEGEQ6QOPOikRzQ8WvxFVDIuf92cssv8LmPbqSm2A/77EumLxX
         RukLcyww2OoAvPTA70F4IztUw6qf3yFsFYWyFQpKidauIlxdBXVlYnhU19qtZLgXR2BO
         w4A9cAb8Yjp6sZB4tOFj9rBo+Klhs4xWI+E8gAlniP1LHuZDw9+J7soLuB8OSbDtDKeS
         4r/hsYuND4dWQN0n36NRcaN0YYrkGBgnn0G19tTSCMZPQt3Uoh2OPleO6Fc7dG6cQFPW
         dp4yjLtohnjnfhFd+L159IaJWARDC/lujRkqtJar1zyIkYsdchNXvpx1IyVy94ztl2nF
         TZqA==
X-Gm-Message-State: AOJu0YyGiC1cuB+kgBUitq8LmUgqlZyk/GeVDXGt8E+dceuTCOLcK0h4
	Ixo0iMEqE59HOl3f16ND7m03dr2rPMYLO4xnoSLzZkS7B79pY6ezggzi/ERagfimMIrQ885esk8
	aJPvZvLTCj2j+xQiYMGzCY2eEs+X6JInXKqolfgzi5g==
X-Gm-Gg: Acq92OHF1kUoa766CQ8FhGkD6AUkeXDiKgQHAmBYRd4CgqSIAULQGcEWFFdQPhPf0AQ
	yElCLYWfIh6tb/VK9xyhGbx4yGZi9RfEQXmm1ozo8oYRI4tppXngy5YQzfaDmmtQbCFofbT/wDF
	s7OgBSOUSnoUOxkP7gUkLkxybRDCJZw6MLKG8ZkodY72fD2GpMBZUFrl91gRo1uBZ8hxGgO3JDV
	6Ef4kLPgv4t3eS9235SQ4ye4QWUAsvJOuZvhRuXx79FGS5OkjNi5UG/FE+FA2UrxImmL5ycynaW
	M0F0mGOVSEBqiFnwgMb3bqzolH4gsYiXW5pOCQVznnLK3YFQDL8=
X-Received: by 2002:a05:622a:11ca:b0:50e:600a:638c with SMTP id
 d75a77b69052e-517987a919amr251149881cf.17.1781078450998; Wed, 10 Jun 2026
 01:00:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260609213658.3679900-1-joannelkoong@gmail.com>
In-Reply-To: <20260609213658.3679900-1-joannelkoong@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 10 Jun 2026 10:00:40 +0200
X-Gm-Features: AVVi8CcXL4PJu1_I8uUhQDVTP8MKRUX0bzbp_3BFt68vL0WpsvsBXMfJJyi4hiI
Message-ID: <CAJfpegvcLNCJVsBsExZSrn2uK=YEePNTnz4D7jKgF4gTSsohPw@mail.gmail.com>
Subject: Re: [PATCH v1] fuse: remove request-less entries from ent_w_req_queue
 to fix NULL deref
To: Joanne Koong <joannelkoong@gmail.com>
Cc: fuse-devel@lists.linux.dev, bernd@bsbernd.com, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Jun 2026 at 23:37, Joanne Koong <joannelkoong@gmail.com> wrote:
>
> If a copy into the userspace ring buffer fails, a request will be
> terminated and fuse_uring_req_end() will set ent->fuse_req to NULL but
> it will leave the entry on ent_w_req_queue in FRRS_FUSE_REQ state. This
> can lead to a NULL deref if the request expiration logic scans
> ent_w_req_queue in the window before the entry is moved off it.
>
> Fix this by taking the entry off ent_w_req_queue and changing its state
> from FRRS_FUSE_REQ to FRRS_INVALID before terminating the request.
>
> Fixes: 4fea593e625c ("fuse: optimize over-io-uring request expiration check")
> Cc: stable@kernel.org
> Signed-off-by: Joanne Koong <joannelkoong@gmail.com>

Applied, thanks.

Miklos
