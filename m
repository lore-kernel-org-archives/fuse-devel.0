Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795053894;
	b=Dc4hQFroDLCafill8Y98/IulXCxFYvYXabyIgqu4IPsf6zlqov8lBBngEir7CqvrVR7k
	 4gVzYLlvhLSJZGNaJtZnXlO3dOrq6USsq4t7mJfCCm6fNw1gpSayyoYBX7HjDsYfnA+h5
	 k3BAQi2J2wLRRqLV3mZ4RgXB+bLBJCWaGqitPPj36k8XNT82k23eQbeGWEFK9daSGwjlv
	 BMtpPoxw63QFTzfH/pYyy6nIQmUIWC84AlD1VOaEHqG+OA0u9OwqQ0UtfRFUyo8h3Afzw
	 bMWFeNYrpCCvCt/Uha0J3LJnY5OdcVNMyTRA24z6jjo7YkBz1MZfPm+qcqupIY/wOLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795053894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kC+uhz3Afjp9Cqz8zh23wNboDVMQQa75pZ1niNRa9cE=;
	b=pkyoWHsqUZ1XSXWDxoND01MlYj2B0tJG4HygMVJwy2W4Kga+bniF8DtY9A1/HRqd6nAf
	 DqiNO6qljNcc0NWWR5rinnGWnUyPoxYQgZsixt/aPh+Pb9FtNR/iG4pOTZnNzS7hxW28e
	 GCn9gzP7VsRYsC+kNeHDP2R5k7dNt9+q37yNqmnRiv7dl1sMQH6UzmlPnfkjWW2CnFY19
	 fEZbHdeSEaAvvh8wE0cYhykyelxTP/8OmsZfWXQoyNzDpdwnFtKDqRoO7LGv0gpD82oGn
	 bz30Y8V9eVSa3D9kfctrBKGxxadMx38a9pZMUyDif4AoWN5584hzGbPYtAy/wUyTACQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mpCCGYZy;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02DF606A332
	for <fuse-devel@lists.linux.dev>; Thu, 19 Nov 2026 02:04:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F02DF606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mpCCGYZy
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b3f9cbafecso38200a91.3
        for <fuse-devel@lists.linux.dev>; Wed, 18 Nov 2026 18:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795053893; x=1795658693; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kC+uhz3Afjp9Cqz8zh23wNboDVMQQa75pZ1niNRa9cE=;
        b=mpCCGYZyy9yRYF2K/RXi57aWNZyrUdrRbt+C3eEDzTxEwPGTeMi6LorHtCmtI03BJa
         HCjufkGszU9TInj4elm4HzgY8m0FKy+D2NpARH+1trhfjXOpjGd7pQ90u7o6dkVYgy86
         mXGTkXZp/p6VgavKy9CRmnu3Sx2Ta42s4jtkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795053893; x=1795658693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kC+uhz3Afjp9Cqz8zh23wNboDVMQQa75pZ1niNRa9cE=;
        b=vnWkCnhdIsCen3X5HXkJL4/Qg2vzEOOHXSRbQ/mhHmGxb94IioKp7muZnpOnzEYKdE
         /xN9dcI6928avUPdQfPr/DVH00LRp5JtO7NysMnwaBtxxhpvVsFn/SkyxzZj3DgZOMCy
         jPvfmnRaY63381SK5Sp2zQZlktqb2YHoEmaOkdMcp05lUAE5KLgkeqdanWojDIl0FJnR
         xRWMRVKypYi6pKukRlHdn296oSzCTGm7Yp7vUOL2IPK59pZPGHsW21mRAhoNxdwiBQCY
         ku/ij9/rZJR00EvL5JTyK0BZv1cyf3f27tOiBFXKuCQXHTF76YJLtM1oJML4VXrQ+Pa+
         Pi0A==
X-Forwarded-Encrypted: i=1; AL+hErFUrAjzrUOHv26Wt0x3q/CaYSvut3T7yFRxhICspn2PYCETQJj+M+DzIzs69Wib0xDiMnRjHyTDytnq@lists.linux.dev
X-Gm-Message-State: APuU4Z+KWdeHdo0n8m1sDjjxg5UmozSKTNyPySxO0/X7vaytgX8j3+xH
	I3NPF9SLHohzlmRo216PGQtwh01s3annTX6w6yHbEM70ELTV3SPh/r06d1uSCVwzuw==
X-Gm-Gg: AZFdTZfeb+CeCMMdnohAC6g090IQ8hE3P4BF8G0r6kRNe8ol6FhyDQRwFoQhDHknln5
	zWcneiJIO5PYt4R9LMUTpwiCThYLyLK12JrDQdw2UKxwvnaukTl4qZQXnhHJxQrzmzEnzurGL/B
	5T5RcGKjcCLSeM9cuaRpZ3+U/woauFJNl0LT15KgUnPVCYIJF0ub+K+kVHR2JBmN4cRWNOBt+KI
	0gfPfX3BF4yMt5C1Ct9idAYRXm5gv1Y7so/cD44MR/8e0f6iT3E1nEiL9AQuBKOVedf8sWjfld/
	854FBsk/Tod2H9eTfLCtvXWtE3tZbGEECD88aUl8ZcVsNDYYo3cuCZyIx906tsp8YKQt+CNKXYa
	BlD5056jbQ+HFc/3xWdwZNQIjYjSWo3+uYpUbViad70L6W5WjLEzxm494uxSVwdy2GacxEc3q9D
	LBKdIBMqeQJcbZcZ0DddBMG7L/JJPQgIKQprZIPrpaBB8xMz7kvauwDC8piTk0V6ue/SmBLRoeh
	fnKn+PA0jamIJFoF1nokmVszh4ArWVFaxD9Lr9arW42DkMfMj324d8guuOCr4tZAZNgk+o0NgCY
	imX389bxTVvaFMmvTj+q4omtDZcUlDbRCCJERU5D2Vbh50EaWf6EENJl6KAEECuSHCFOUA==
X-Received: by 2002:a17:90b:2805:b0:3b3:c92e:f523 with SMTP id 98e67ed59e1d1-3b3d0764320mr7560562a91.3.1795053893354;
        Wed, 18 Nov 2026 18:04:53 -0800 (PST)
Received: from localhost (221.247.125.34.bc.googleusercontent.com. [34.125.247.221])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b3fe0e5bd4sm772079a91.17.2026.11.18.18.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 18:04:52 -0800 (PST)
From: Jeff Xu <jeffxu@chromium.org>
To: David Hildenbrand <david@kernel.org>
Cc: Jeff Xu <jeffxu@chromium.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Marco Elver <elver@google.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chia-I Wu <olvaffe@gmail.com>,
	Dev Jain <dev.jain@arm.com>,
	Ian Rickards <ian.rickards@arm.com>,
	Jann Horn <jannh@google.com>,
	Jeff Vander Stoep <jeffv@google.com>,
	Jeff Xu <jeffxu@google.com>,
	Kees Cook <kees@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Collingbourne <peter@pcc.me.uk>,
	=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?= <ptosi@google.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Baoquan He <baoquan.he@linux.dev>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Allison Henderson <achender@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-mm@kvack.org,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	fuse-devel@lists.linux.dev,
	kexec@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	rds-devel@oss.oracle.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/7] mm: kasan: skip KASAN for GFP_HIGHUSER
Date: Wed, 18 Nov 2026 18:04:45 -0800
Message-ID: <20261119020445.1096831-1-jeffxu@chromium.org>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
In-Reply-To: <332f315d-ea27-488a-9a3c-28cdfdcd5f27@kernel.org>
References: <20261116230627.3537051-1-jeffxu@chromium.org> <2066d131-f999-4747-beb8-520d5e0ce1db@kernel.org> <CAAFQd5DzTmyeVQxNdhdy8pPi+ts1cCgbztVJiMoNBeJWBzjdQQ@mail.gmail.com> <20261118012858.289236-1-jeffxu@chromium.org> <332f315d-ea27-488a-9a3c-28cdfdcd5f27@kernel.org>
X-Mailing-List: fuse-devel@lists.linux.dev
List-Id: <fuse-devel.lists.linux.dev>
List-Post: <mailto:fuse-devel@lists.linux.dev>
List-Help: <mailto:fuse-devel+help@lists.linux.dev>
List-Subscribe: <mailto:fuse-devel+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:fuse-devel+unsubscribe@lists.linux.dev>
List-Owner: <mailto:fuse-devel+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Nov 18, 2026 at 10:46 AM David Hildenbrand (Arm) <david@kernel.org> wrote:
> > 1) Simply keep those 4 cases under GFP_HIGHUSER (drop patches 1-4 and
> >    7), reducing the series to just the GFP_HIGHUSER change and its KUnit
> >    test.
>
> That's what I would look into first.

Thanks David. I'll wait a few days in case there is more feedback, for
example from the KASAN side, and then send v2 with approach (1).

Jeff
